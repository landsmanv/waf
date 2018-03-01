#!/bin/bash
/sbin/sysctl -p
trap "apachectl -k stop" EXIT
rm -rf /var/run/httpd/*
/usr/sbin/httpd -DFOREGROUND
