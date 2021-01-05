ARG MYSQL_BACKUP_VERSION=master
FROM databack/mysql-backup:${MYSQL_BACKUP_VERSION}

USER root
ARG RCLONE_VERSION=current
RUN apk add --update ca-certificates fuse tzdata wget unzip \
  && echo "user_allow_other" >> /etc/fuse.conf \
  && wget https://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-amd64.zip -O rclone.zip \
  && unzip rclone.zip \
  && cp rclone-*-linux-amd64/rclone /usr/bin/ \
  && chown root:root /usr/bin/rclone \
  && chmod 755 /usr/bin/rclone \
  && rm -rf rclone.zip rclone-*-linux-amd64
USER appuser

ENV XDG_CONFIG_HOME=/config
