#!/bin/bash
#默认使用 fpm版本
cd php-fpm
docker build --rm --no-cache  -t scjtqs/kodbox:arm64  .
docker push scjtqs/kodbox:apache-arm64