#!/bin/bash
if [ "$1" == "1" ]; then
	docker buildx build . --platform linux/arm64,linux/amd64 --tag localhost:5000/kctlapp-multiarch --push \
	-f dockerfiles/Dockerfile
fi

if [ "$1" == "2" ]; then
	docker buildx build . --platform linux/arm64,linux/amd64 --tag localhost:5000/cronjob-multiarch --push \
	-f dockerfiles/cronDockerfile
fi

if [ "$1" == "3" ]; then
	docker buildx build . --platform linux/arm64 --tag localhost:5000/jupyterapp-arm --push \
	-f dockerfiles/jupyterarmDockerfile
fi
