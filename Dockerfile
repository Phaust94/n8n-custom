FROM docker.n8n.io/n8nio/n8n:1.123.13
USER root
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*
# Match the original user if necessary (e.g., USER node)
USER node