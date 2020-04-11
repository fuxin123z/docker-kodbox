#!/bin/bash
##跨平台编译
docker run --rm --privileged multiarch/qemu-user-static:register --reset
docker build --rm --no-cache  -t scjtqs/kodbox:fpm-arm64 -f Dockerfile.arm64 .
docker push scjtqs/kodbox:apache-arm64