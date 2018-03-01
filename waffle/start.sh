#!/bin/bash
/sbin/sysctl -p
trap "apachectl -k stop" EXIT
rm -rf /var/run/httpd/*

sed -i -e "s/DB_HOST_PARAM/$DB_HOST_PARAM/g" /usr/local/waf-fle/config.php
sed -i -e "s/DB_USER_PARAM/$DB_USER_PARAM/g" /usr/local/waf-fle/config.php
sed -i -e "s/DB_PASS_PARAM/$DB_PASS_PARAM/g" /usr/local/waf-fle/config.php
sed -i -e "s/DATABASE_PARAM/$DATABASE_PARAM/g" /usr/local/waf-fle/config.php
sed -i -e "s/SETUP_PARAM/$SETUP_PARAM/g" /usr/local/waf-fle/config.php

/usr/sbin/httpd -DFOREGROUND
