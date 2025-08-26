#!/bin/bash
docker build . -f "local-pipelines/Dockerfile.itrunner" -t "app-runner"
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock --name "app-runner" --network registry-net app-runner