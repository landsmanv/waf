# mlog2waffle
FROM centos:7
MAINTAINER Vlastimil Landsman vlastimil.landsman@plus4u.net
ENV LANG en_US.UTF-8
ENV TERM=xterm

ADD mlog2waffle.perl /mlog2waffle.perl
ADD mlog2waffle.conf /etc
RUN yum install -y epel-release &&\
    chmod +x /mlog2waffle.perl
RUN yum install -y perl-libwww-perl perl-DBI perl-DBD-MySQL perl-GD perl-Time-HiRes perl-File-Pid perl-File-Tail automake
CMD ["/mlog2waffle.perl"]
