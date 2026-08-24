FROM python:3.9-slim
RUN apt-get update && apt-get install -y ffmpeg
CMD ["sh", "-c", "ffmpeg -re -stream_loop -1 -i 'https://files.catbox.moe/jr19gd.mp4' -c:v libx264 -preset veryfast -pix_fmt yuv420p -c:a aac -f flv 'rtmp://a.rtmp.youtube.com/live2/cuj7-w2cr-06z4-qj1h-cu66'"]
