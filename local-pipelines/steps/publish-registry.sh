#!/bin/bash
echo -e "\e[32mPublish Registry\e[0m"
echo ""
apt-get update
apt-get install docker
echo '*
!target/*-runner
!target/*-runner.jar
!target/lib/*
!target/quarkus-app/
' > .dockerignore

docker build . -f "Dockerfile.quar" -t "$PROJECT_NAME:$PROJECT_VERSION"
docker tag $PROJECT_NAME:$PROJECT_VERSION $DOCKER_REGISTRY/$PROJECT_NAME:$PROJECT_VERSION
# docker login $DOCKER_REGISTRY
docker push $DOCKER_REGISTRY/$PROJECT_NAME:$PROJECT_VERSION
echo ""
