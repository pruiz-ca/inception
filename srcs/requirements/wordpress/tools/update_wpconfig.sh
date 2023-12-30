#!/bin/sh

# Crear archivo de configuracion
cat << EOF > /var/www/html/wordpress/wp-config.php
<?php
// ** MySQL settings - You can get this info from your web host ** //
define( 'DB_NAME', '$WORDPRESS_DB_NAME' );
define( 'DB_USER', '$WORDPRESS_DB_USER' );
define( 'DB_PASSWORD', '$WORDPRESS_DB_PASSWORD' );
define( 'DB_HOST', '$WORDPRESS_DB_HOST' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

EOF
