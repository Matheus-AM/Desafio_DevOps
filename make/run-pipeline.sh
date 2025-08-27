#!/bin/bash
KUBE_PATH='/mnt/c/Users/macac/.kube' # path do seu .kube
docker build . -f "local-pipelines/Dockerfile.runner" -t "app-runner"
docker run -i --rm -v $KUBE_PATH:/root/.kube:ro -v /var/run/docker.sock:/var/run/docker.sock --name "app-runner" --network=registry-net app-runner