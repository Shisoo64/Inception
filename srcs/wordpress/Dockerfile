FROM alpine:3.18

# Installing nginx and openssl
RUN apk add php81 \
			php81-dev \
			php81-common \
			php81-gd \
			php81-xmlreader \
			php81-bcmath \
			php81-ctype \
			php81-curl \
			php81-exif \
			php81-iconv \
			php81-intl \
			php81-mbstring \
			php81-opcache \
			php81-openssl \
			php81-pcntl \
			php81-phar \
			php81-session \
			php81-xml \
			php81-xsl \
			php81-zip \
			php81-zlib \
			php81-dom \
			php81-fpm \
			php81-sodium \
			php81-tokenizer \
			php81-mysqli


# Copying and chmoding entrypoint script
COPY ./www.conf /tmp/www.conf
COPY ./script.sh /tmp/super.sh
RUN chmod +x /tmp/super.sh

ENTRYPOINT ["/tmp/super.sh"]