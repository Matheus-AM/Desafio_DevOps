#!/bin/bash
docker build . -f "local-pipelines/Dockerfile.runner" -t "app-runner"
docker run -i --rm -v /var/run/docker.sock:/var/run/docker.sock --name "app-runner" --network registry-net app-runner 
