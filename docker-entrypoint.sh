#!/bin/bash
set -e

# Railway provides $PORT — default to 80 if not set
PORT=${PORT:-80}

echo "Starting phpMyAdmin on port $PORT"

# Fix: disable conflicting MPM modules, keep only mpm_prefork (required for PHP)
a2dismod mpm_event mpm_worker 2>/dev/null || true
a2enmod mpm_prefork 2>/dev/null || true

# Patch Apache to listen on the Railway-assigned port
sed -i "s/Listen 80/Listen $PORT/" /etc/apache2/ports.conf
sed -i "s/<VirtualHost \*:80>/<VirtualHost *:$PORT>/" /etc/apache2/sites-enabled/*.conf

# Start Apache foreground
exec apache2-foreground
