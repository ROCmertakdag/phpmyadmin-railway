# Use phpMyAdmin official FPM image
FROM phpmyadmin/phpmyadmin:latest

# Install supervisor to manage php-fpm
RUN apt-get update && \
    apt-get install -y supervisor && \
    apt-get clean

# Copy supervisord config
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Expose port 80
EXPOSE 80

# Start supervisor
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
