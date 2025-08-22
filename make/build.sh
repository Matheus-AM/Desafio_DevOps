#!/bin/bash
mv .dockerignore .dockerignore.bak
docker build . -f "Dockerfile.mvn" -t "app-mvn"
MYPATH="$(pwd)"
docker run --rm -v "$MYPATH:/app" "app-mvn"
mv .dockerignore.bak .dockerignore
# echo "$(pwd)/target:/app/target"
