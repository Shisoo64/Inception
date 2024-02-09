FROM alpine:3.18
EXPOSE 443

# Installing nginx and openssl
RUN apk add nginx openssl
RUN rm -rf /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/nginx.conf

# Creating SSL key
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=rlaforge.42.fr/UID=rlaforge"


# Copying and chmoding entrypoint script
COPY ./script.sh /tmp/super.sh
RUN chmod +x /tmp/super.sh



ENTRYPOINT ["/tmp/super.sh"]