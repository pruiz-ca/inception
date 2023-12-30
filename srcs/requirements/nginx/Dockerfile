ARG ALPINE_VERSION
FROM alpine:$ALPINE_VERSION

# Actualizar el sistema e instalar los paquetes necesarios
RUN apk update && apk upgrade && apk add --update --no-cache \
	nginx \
	openssl \
	openssh

# Copiar el archivo de configuracion de NGINX
RUN mkdir -p run/nginx
COPY conf/nginx.conf /etc/nginx/
COPY conf/server.conf /etc/nginx/http.d/

# Crear el certificado SSL
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/certs/nginx.crt -keyout /etc/ssl/private/nginx.key \
	-subj "/C=SP/ST=Madrid/L=Madrid/O=42madrid/OU=pruiz-ca/CN=localhost"

# Exponer el puerto para acceder al contenedor
EXPOSE 443

# Iniciar el servicio
# CMD ["/usr/sbin/sshd"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
