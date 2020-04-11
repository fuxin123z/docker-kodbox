#!/bin/bash
#默认使用 fpm版本
cd php-fpm
docker run --rm --privileged multiarch/qemu-user-static:register --reset
docker build --rm --no-cache --pull -t scjtqs/kodbox:arm64 -f Dockerfile.arm64 .