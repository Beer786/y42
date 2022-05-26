#!/bin/bash

IMAGE_REPO=local/simpleweb
IMAGE_TAG=latest
UNIX_TIME=$(date +'%s')
#eval $(minikube docker-env)
docker build -f Dockerfile --build-arg BUILD_AT=${UNIX_TIME} -t ${IMAGE_REPO}:${IMAGE_TAG} .
if [ $? -eq 0 ]
then 
echo "Image build_at: ${UNIX_TIME}"
else
echo "Problem with Dockerfile"
fi