ARG ALPINE_VERSION
FROM alpine:$ALPINE_VERSION

# Importar variables de entorno del docker-compose
ARG WORDPRESS_DB_USER
ARG WORDPRESS_DB_PASSWORD
ARG WORDPRESS_DB_HOST
ARG WORDPRESS_DB_NAME

# Actualizar el sistema e instalar los paquetes necesarios
RUN apk update && apk upgrade && apk add --update --no-cache \
	wget \
    curl \
	php-fpm \
	php \
    php-phar \
    php-curl \
    php-dom \
    php-exif \
    php-fileinfo \
    php-json \
    php-mbstring \
    php-mysqli \
    php-sodium \
    php-openssl \
    php-xml \
    php-zip \
    gcc musl-dev make

# Descargar y descomprimir WordPress y PhpMyadmin
RUN wget https://wordpress.org/latest.tar.gz -P ./tmpfiles/
RUN mkdir -p /var/www/html/
RUN tar -xzf ./tmpfiles/latest.tar.gz -C /var/www/html/

# Copiar archivos de configuracion
COPY tools/ /tools/
COPY conf/wp-config.php /tools/
RUN sh /tools/update_wpconfig.sh
RUN cat /tools/wp-config.php >> /var/www/html/wordpress/wp-config.php
RUN	echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf

# Exponer el puerto para acceder al contenedor
EXPOSE 9000

# Iniciar el servicio
CMD ["php-fpm7", "--nodaemonize"]
