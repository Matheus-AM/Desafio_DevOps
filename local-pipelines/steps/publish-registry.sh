#!/bin/bash
echo -e "\e[32mPublish Registry\e[0m"
echo ""

docker build . -f "Dockerfile.quar" -t "$DOCKER_REGISTRY/$PROJECT_NAME:$PROJECT_VERSION"
# docker login $DOCKER_REGISTRY
docker push $DOCKER_REGISTRY/$PROJECT_NAME:$PROJECT_VERSION
echo ""
