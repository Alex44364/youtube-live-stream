FROM python:3.9-slim
RUN apt-get update && apt-get install -y ffmpeg
RUN pip install flask
COPY <<EOF /start.sh
python3 -c "
import subprocess, os, time
from flask import Flask
app = Flask(__name__)
@app.route('/')
def home():
    return 'Alive'
import threading
threading.Thread(target=lambda: app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 10000))), daemon=True).start()

while True:
    subprocess.run(\"ffmpeg -re -stream_loop -1 -i 'https://github.com/Alex44364/youtube-live-stream/releases/download/v1/InShot_20260824_122903219.mp4' -c:v libx264 -preset veryfast -pix_fmt yuv420p -c:a aac -f flv 'rtmp://a.rtmp.youtube.com/live2/3g7j-2yx1-wp1h-0zgy-6dbd'\", shell=True)
    time.sleep(5)
"
EOF
CMD ["sh", "/start.sh"]
