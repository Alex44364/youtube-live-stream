#!/bin/bash
python3 -c "
import os
from flask import Flask
app = Flask(__name__)
@app.route('/')
def home():
    return 'Alive'
app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 10000)))
" &

while true; do
    ffmpeg -re -stream_loop -1 -i 'https://github.com/Alex44364/youtube-live-stream/releases/download/v1/InShot_20260824_122903219.mp4' -c:v libx264 -preset veryfast -pix_fmt yuv420p -c:a aac -f flv 'rtmp://a.rtmp.youtube.com/live2/3g7j-2yx1-wp1h-0zgy-6dbd'
    sleep 5
done
