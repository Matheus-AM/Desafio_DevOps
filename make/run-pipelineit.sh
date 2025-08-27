#!/bin/bash
export KUBE_PATH='/mnt/c/Users/****/.kube' # path do seu .kube
docker build . -f "local-pipelines/Dockerfile.itrunner" -t "app-runner"
docker run -it --rm -v $KUBE_PATH:/root/.kube:ro -v /var/run/docker.sock:/var/run/docker.sock --name "app-runner" --network=registry-net app-runner-it