#!/bin/bash

set -e
docker run --privileged --rm tonistiigi/binfmt --install all
#docker buildx create --name multiarch --platform linux/amd64,linux/amd64/v2,linux/amd64/v3,linux/arm64,linux/386,linux/arm/v7 --use default
docker buildx build \
			-f Dockerfile \
			--platform linux/amd64 \
			--build-arg VERSION=1.31.0 \
			--tag 561760315420.dkr.ecr.ap-northeast-2.amazonaws.com/tile38:1.31.0 \
			--push \
			.