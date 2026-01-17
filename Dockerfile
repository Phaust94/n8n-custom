FROM docker.n8n.io/n8nio/n8n:1.123.13
USER root
RUN apk add --no-cache ffmpeg
# Match the original user if necessary (e.g., USER node)
USER node