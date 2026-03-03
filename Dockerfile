FROM phpmyadmin/phpmyadmin:latest

# Fix: create the missing secret config that Debian's phpMyAdmin expects
RUN mkdir -p /etc/phpmyadmin && \
    echo '<?php $cfg["blowfish_secret"] = "r4!Xk9#mP2vLqZnYwUdEhCjTsAbFgOi8";' \
    > /etc/phpmyadmin/config.secret.inc.php

# Copy custom entrypoint
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
