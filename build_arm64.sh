#!/bin/bash
#默认使用 fpm版本
cd php-fpm
docker build --rm --no-cache --pull -t scjtqs/kodbox:arm64  .