#!/bin/bash
mv .dockerignore .dockerignore.bak
docker build . -f "local-pipelines\Dockerfile.runner" -t "app-runner"
docker run -i --rm -p 8080:8080 "app-runner"
mv .dockerignore.bak .dockerignore
