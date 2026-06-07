FROM alpine:3.22 AS alpine-tools

# 2. Use your exact n8n version
FROM docker.io/n8nio/n8n:2.25.5

USER root

# 3. Only copy the main apk binary and the necessary configuration directories
COPY --from=alpine-tools /sbin/apk /sbin/apk
COPY --from=alpine-tools /etc/apk /etc/apk
COPY --from=alpine-tools /lib/apk /lib/apk
RUN apk add --no-cache ffmpeg
# Match the original user if necessary (e.g., USER node)
USER node