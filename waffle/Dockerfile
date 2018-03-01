# Waffle based on Apache 2.4
FROM apache:2.4
MAINTAINER Vlastimil Landsman vlastimil.landsman@plus4u.net
ENV LANG en_US.UTF-8
ENV TERM=xterm

ADD start.sh /start.sh
RUN yum install -y epel-release wget
RUN yum install -y php php-pdo php-mysql php-pdo php-apc php-pecl-geoip &&\
    chmod +x /start.sh &&\
    cd /usr/share/GeoIP &&\
    wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz &&\
    wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz &&\
    wget http://geolite.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz &&\
    gzip -df GeoIP.dat.gz &&\
    gzip -df GeoLiteCity.dat.gz &&\
    gzip -df GeoIPASNum.dat.gz &&\
    mv GeoLiteCity.dat GeoIPCity.dat &&\
    cp GeoIPASNum.dat GeoIPISP.dat
ADD waf-fle.tar.gz /usr/local
ADD config.php /usr/local/waf-fle
ADD waf-fle.conf /etc/httpd/conf.d
CMD ["/start.sh"]