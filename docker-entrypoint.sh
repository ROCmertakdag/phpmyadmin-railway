#!/bin/bash
set -e

# Railway provides $PORT — default to 80 if not set
PORT=${PORT:-80}

echo "Starting phpMyAdmin on port $PORT"

# Fix: disable conflicting MPM modules, keep only mpm_prefork (required for PHP)
a2dismod mpm_event mpm_worker 2>/dev/null || true
a2enmod mpm_prefork 2>/dev/null || true

# Fix: create missing phpMyAdmin secret config file
mkdir -p /etc/phpmyadmin
if [ ! -f /etc/phpmyadmin/config.secret.inc.php ]; then
    SECRET=$(openssl rand -base64 32)
    echo "<?php \$cfg['blowfish_secret'] = '$SECRET';" > /etc/phpmyadmin/config.secret.inc.php
fi

# Set Apache to listen on the Railway-assigned port (restart-safe)
echo "Listen $PORT" > /etc/apache2/ports.conf
sed -i "s/<VirtualHost \*:[0-9]*>/<VirtualHost *:$PORT>/" /etc/apache2/sites-enabled/*.conf

# Start Apache foreground
exec apache2-foreground
