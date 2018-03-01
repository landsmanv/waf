#!/bin/sh
docker build --rm -t waffle:0.6.4 waffle
docker tag waffle:0.6.4 h-ehqswb38.rg-euc1irrg.uu-os8-dckimgrepo.eu-c-1.cloud.plus4u.net:5000/waffle:0.6.4
docker push h-ehqswb38.rg-euc1irrg.uu-os8-dckimgrepo.eu-c-1.cloud.plus4u.net:5000/waffle:0.6.4