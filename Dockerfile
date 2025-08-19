FROM rclone/rclone:1.68.1

LABEL maintainer=JiHel-dev

USER root

WORKDIR /app
COPY ./sync-rclone.sh /app/
RUN chown nobody /app

USER nobody

WORKDIR /app
ENTRYPOINT [ "rclone" ]
