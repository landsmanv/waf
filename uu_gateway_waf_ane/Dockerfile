# Prepares basic image of uuGateway
# (image without routes configuration)
FROM apache:2.4.29_secure

ADD conf.d/ /etc/httpd/conf.d
ADD conf /etc/httpd/conf
ADD conf.modules.d /etc/httpd/conf.modules.d
ADD httpd-ssl-pass-dialog /usr/libexec/

# Gateway containers need raised max number of arrays limit (in order to
# prevent "No space left on device: AH00023: Couldn't create the mpm-accept
# mutex" errors) - each worker in node_groups.conf allocates ~3 arrays.
#
# The container needs to be run with the following parameters (which cannot be
# set from inside):
# docker run --privileged=true --cap-drop=ALL --cap-add=SYS_RESOURCE ...
COPY sysctl.conf /etc/sysctl.conf

COPY start.sh /start.sh
RUN chmod +x /start.sh
RUN chmod +x /usr/libexec/httpd-ssl-pass-dialog &&\
    rm -f /etc/localtime &&\
    ln -s /usr/share/zoneinfo/Europe/Prague /etc/localtime

RUN ln -s /dev/stdout /etc/httpd/logs/stdout.log &&\
    ln -s /dev/stdout /etc/httpd/logs/error_log

CMD ["/start.sh"]
