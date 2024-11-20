#!/bin/bash

# Setting necessary variables
IMAGE_NAME="amunipelumi/ansible-ee:v1.1"
CONTAINER_NAME="ansible-ee"
WORKDIR="/ansible"
ROOTDIR="/root"

# Checking if container exists
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container..."
    docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
fi

# Running the container interactively
docker run -it --name $CONTAINER_NAME \
    -v ansible_volume:$WORKDIR \
    -v ansible_root:$ROOTDIR \
    $IMAGE_NAME bash
