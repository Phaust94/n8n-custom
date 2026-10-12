FROM alpine:3.24 AS alpine-tools

# 2. Use your exact n8n version
FROM docker.io/n8nio/n8n:2.43.4

USER root

# 3. Only copy the apk binary (+ matching libapk). Do NOT overwrite
# /etc/apk (repos) or /lib/apk (installed DB) from the n8n base image.
COPY --from=alpine-tools /sbin/apk /sbin/apk
COPY --from=alpine-tools /usr/lib/libapk.so.3.0.0 /usr/lib/libapk.so.3.0.0
RUN apk add --no-cache ffmpeg
# Match the original user if necessary (e.g., USER node)
USER node