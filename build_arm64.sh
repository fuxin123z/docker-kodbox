#!/bin/bash
docker build --rm --no-cache --pull -t scjtqs/kodbox:arm64 -f Dockerfile.arm64 .