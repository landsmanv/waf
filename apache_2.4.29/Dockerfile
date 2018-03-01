# Compile Apache 2.4.29 with http2, modsecurity(disabled) from sources, + centos like configuration, cleanup
FROM centos:latest
MAINTAINER Vlastimil Landsman vlastimil.landsman@plus4u.net
ENV LANG en_US.UTF-8
ENV TERM=xterm

ARG OPENSSL_VERSION=openssl-1.1.0g
#ARG OPENSSL_VERSION=openssl-1.0.2l
ARG NGHTTP2_VERSION=1.27.0
ARG APR_VERSION=apr-1.6.3
ARG APR_UTIL_VERSION=apr-util-1.6.1
ARG HTTPD_VERSION=httpd-2.4.29
ARG DEV_TOOLS="make wget perl gcc expat-devel zlib-devel pcre-devel yajl-devel curl-devel libxml2-devel"
ARG MODSECURITY_VERSION=2.9.2

RUN echo a &&\
    yum update -y &&\
    yum install -y ${DEV_TOOLS} &&\
    rm -f /etc/localtime &&\
    ln -s /usr/share/zoneinfo/Europe/Prague /etc/localtime
RUN wget https://www.openssl.org/source/${OPENSSL_VERSION}.tar.gz &&\
    tar -zxvf ${OPENSSL_VERSION}.tar.gz &&\
    cd ${OPENSSL_VERSION} &&\
    ./config shared zlib-dynamic --prefix=/usr/local/ssl &&\
    make &&\
    make install &&\
    ln -s /usr/local/ssl/bin/openssl /usr/bin/openssl &&\
    echo "/usr/local/lib" >> /etc/ld.so.conf.d/http2.conf &&\
    echo "/usr/local/ssl/lib" >> /etc/ld.so.conf.d/http2.conf &&\
    ldconfig
RUN wget https://github.com/nghttp2/nghttp2/releases/download/v${NGHTTP2_VERSION}/nghttp2-${NGHTTP2_VERSION}.tar.gz &&\
    tar -zxvf nghttp2-${NGHTTP2_VERSION}.tar.gz &&\
    cd nghttp2-${NGHTTP2_VERSION} &&\
    export OPENSSL_CFLAGS="-I/usr/local/ssl/include" &&\
    export OPENSSL_LIBS="-L/usr/local/ssl/lib -lssl -lcrypto" &&\
    ./configure &&\
    make &&\
    make install
RUN wget http://www-eu.apache.org/dist/apr/${APR_VERSION}.tar.gz &&\
    tar -zxvf ${APR_VERSION}.tar.gz &&\
    cd ${APR_VERSION} &&\
    ./configure &&\
    make &&\
    make install
RUN wget http://www-eu.apache.org/dist/apr/${APR_UTIL_VERSION}.tar.gz &&\
    tar -zxvf ${APR_UTIL_VERSION}.tar.gz &&\
    cd ${APR_UTIL_VERSION} &&\
    ./configure --with-apr=/usr/local/apr &&\
    make &&\
    make install
RUN wget http://www-eu.apache.org/dist/httpd/${HTTPD_VERSION}.tar.gz &&\
    tar -zxvf ${HTTPD_VERSION}.tar.gz &&\
    cd ${HTTPD_VERSION} &&\
    cp -r ../${APR_VERSION} srclib/apr &&\
    cp -r ../${APR_UTIL_VERSION} srclib/apr-util &&\
    ./configure --enable-so --prefix=/etc/httpd --with-ssl=/usr/local/ssl --enable-unique-id --enable-ssl=shared --enable-rewrite  --enable-deflate --enable-asis --enable-filter --with-pcre --with-included-apr --enable-headers --enable-expires --enable-proxy --with-mpm=event --enable-rewrite --enable-http2 &&\
    make &&\
    make install &&\
    cp /etc/httpd/bin/* /usr/sbin/
RUN wget https://www.modsecurity.org/tarball/${MODSECURITY_VERSION}/modsecurity-${MODSECURITY_VERSION}.tar.gz &&\
    tar xzfv modsecurity-${MODSECURITY_VERSION}.tar.gz &&\
    cd modsecurity-${MODSECURITY_VERSION} &&\
    ./configure --with-yajl &&\
    make &&\
    make install
RUN rm -rf ${OPENSSL_VERSION} nghttp2-${NGHTTP2_VERSION} ${APR_VERSION} ${APR_UTIL_VERSION} ${HTTPD_VERSION} modsecurity-${MODSECURITY_VERSION} &&\
    rm -f ${OPENSSL_VERSION}.tar.gz nghttp2-${NGHTTP2_VERSION}.tar.gz ${APR_VERSION}.tar.gz ${APR_UTIL_VERSION}.tar.gz ${HTTPD_VERSION}.tar.gz modsecurity-${MODSECURITY_VERSION}.tar.gz &&\
    yum remove -y ${DEV_TOOLS} &&\
    yum clean all
RUN echo "Protocols h2 http/1.1" >> /etc/httpd/conf/httpd.conf &&\
    echo "IncludeOptional conf.d/*.conf" >> /etc/httpd/conf/httpd.conf &&\
    sed -i -e 's/\# LoadModule foo_module modules\/mod_foo.so/Include conf.modules.d\/*.conf/g' /etc/httpd/conf/httpd.conf &&\
    sed -i '/modules\//d' /etc/httpd/conf/httpd.conf
ADD 00-base.conf /etc/httpd/conf.modules.d/
ADD 01-ssl.conf /etc/httpd/conf.d/
ADD httpd-ssl-pass-dialog /usr/libexec/
RUN chmod +x /usr/libexec/httpd-ssl-pass-dialog &&\
    ldconfig
EXPOSE 80 443
CMD ["httpd", "-DFOREGROUND"]