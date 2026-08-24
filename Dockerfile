FROM python:3.9-slim
RUN apt-get update && apt-get install -y ffmpeg
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]

