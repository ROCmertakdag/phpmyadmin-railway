<?php
$cfg['blowfish_secret'] = 'EYqZQY9xW5F2JtJQPp6KWNCAKQc7tgF6';
$i = 0;
$i++;
$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['host'] = getenv('PMA_HOST');
$cfg['Servers'][$i]['port'] = getenv('PMA_PORT');
$cfg['Servers'][$i]['user'] = getenv('PMA_USER');
$cfg['Servers'][$i]['password'] = getenv('PMA_PASSWORD');
$cfg['Servers'][$i]['AllowNoPassword'] = false;
$cfg['Servers'][$i]['ssl'] = getenv('PMA_SSL') ? true : false;
