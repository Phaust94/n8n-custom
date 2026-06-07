FROM n8nio/n8n:2.25.5
USER root
RUN apk add --no-cache ffmpeg
# Match the original user if necessary (e.g., USER node)
USER node