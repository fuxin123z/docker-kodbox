#!/bin/bash
docker build --rm --no-cache   -t scjtqs/kodbox:fpm-arm64  .
sleep 5
docker push scjtqs/kodbox:apache-arm64