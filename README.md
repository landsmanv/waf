# web application firewall based on Apache and modsecurity

- apache_2.4.29 - compile Apache 2.4.29 with http2, modsecurity(disabled) from sources, + centos like configuration, cleanup
- apache_2.4.29_secure - activate modsecurity, add owasp rules
- uu_gateway_waf_ane - web aplication proxy gateway with modsecurity and http2
* included docker-compose.yml
- mlog2waffle - my dockerized perl tool to send modsecurity logs to waffle http://waf-fle.org/
- waffle - my dockerized php aplication for analyzing modsecurity logs http://waf-fle.org/
* included docker-compose.yml
- build in that order
