#!/bin/bash
mv .dockerignore .dockerignore.bak
docker build . -f "local-pipelines/Dockerfile.runner" -t "app-runner"
docker run -i --rm -v /var/run/docker.sock:/var/run/docker.sock app-runner
mv .dockerignore.bak .dockerignore
