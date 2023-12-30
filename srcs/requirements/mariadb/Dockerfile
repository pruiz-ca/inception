ARG ALPINE_VERSION
FROM alpine:$ALPINE_VERSION

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_USER
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
# Importar variables de entorno del docker-compose

# Actualizar el sistema e instalar los paquetes necesarios
RUN apk update && apk upgrade && apk add --update --no-cache \
	mariadb \
	mariadb-client \
	openrc

# Copiar la configuracion de MariaDB
COPY conf/mariadb-server.cnf /etc/my.cnf.d/
COPY tools/ /tools/
RUN sh /tools/init_db.sh

# Exponer el puerto para acceder al contenedor
EXPOSE 3306

CMD ["mysqld_safe"]
