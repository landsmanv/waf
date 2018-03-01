# Apache 2.4.29 with modsecurity
FROM apache:2.4.29
MAINTAINER Vlastimil Landsman vlastimil.landsman@plus4u.net
ENV LANG en_US.UTF-8
ENV TERM=xterm

RUN mkdir -p /var/log/mlog2waffle/data &&\
    chown -R daemon:daemon /var/log/mlog2waffle
ADD unicode.mapping /etc/httpd/conf.d/
ADD modsecurity.conf /etc/httpd/conf.d/modsecurity.conf
ADD modsecurity.d.tar.gz /etc/httpd/
EXPOSE 80 443
CMD ["httpd", "-DFOREGROUND"]