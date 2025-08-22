#!/bin/bash
# mv .dockerignore .dockerignore.bak
docker build . -f "Dockerfile.quar" -t "app-quar"
docker run -i --rm -p 8080:8080 "app-quar"
# mv .dockerignore.bak .dockerignore