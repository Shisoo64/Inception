FROM alpine:3.18

# Installing mariadb
RUN apk add mariadb mariadb-common mariadb-client
COPY ./mariadb.conf /tmp/mariadb.conf

# Copying and chmoding entrypoint script
COPY ./script.sh /tmp/super.sh
RUN chmod +x /tmp/super.sh

ENTRYPOINT ["/tmp/super.sh"]