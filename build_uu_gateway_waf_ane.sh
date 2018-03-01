#!/bin/sh
docker build --rm -t uu_gateway_waf_ane:1.0.0 uu_gateway_waf_ane
docker tag uu_gateway_waf_ane:1.0.0 h-ehqswb38.rg-euc1irrg.uu-os8-dckimgrepo.eu-c-1.cloud.plus4u.net:5000/uu_gateway_waf_ane:1.0.0
docker push h-ehqswb38.rg-euc1irrg.uu-os8-dckimgrepo.eu-c-1.cloud.plus4u.net:5000/uu_gateway_waf_ane:1.0.0