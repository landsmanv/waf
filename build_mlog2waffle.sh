#!/bin/sh
docker build --rm -t mlog2waffle:0.6.4 mlog2waffle
docker tag mlog2waffle:0.6.4 h-ehqswb38.rg-euc1irrg.uu-os8-dckimgrepo.eu-c-1.cloud.plus4u.net:5000/mlog2waffle:0.6.4
docker push h-ehqswb38.rg-euc1irrg.uu-os8-dckimgrepo.eu-c-1.cloud.plus4u.net:5000/mlog2waffle:0.6.4