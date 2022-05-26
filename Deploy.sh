#!/bin/bash

IMAGE_REPO=local/simpleweb
IMAGE_TAG=latest
echo "Pushing locally built image to minikube cluster"
# minikube cache add ${IMAGE_REPO}:${IMAGE_TAG}
minikube image load ${IMAGE_REPO}:${IMAGE_TAG}
echo "Image has been pushed"
UNIX_TIME=$(date +'%s')
read -p "Please confirm to deploy: yes/no: " DEP_FLAG
if [ $DEP_FLAG == "yes" ]
then 
    echo "Running service "
    kubectl run  simple-webapps --image=${IMAGE_REPO}:${IMAGE_TAG} --env DEPLOY_AT=$UNIX_TIME --image-pull-policy=IfNotPresent --port=8080
    echo "Service is deployed_at: ${UNIX_TIME}"
fi
