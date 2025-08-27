#!/bin/bash
echo -e "\e[32mPublish Registry\e[0m"
echo ""
## Por se usar o docker.socket do wsl2 host fora do container, O alias de ip usado e 'localhost:5000' do wsl2 host e nao o 'registry:5000' da docker-network
export DOCKER_REGISTRY="localhost:5000"
docker build . -f "Dockerfile.quar" -t "$DOCKER_REGISTRY/$PROJECT_NAME:$PROJECT_VERSION"
docker push $DOCKER_REGISTRY/$PROJECT_NAME:$PROJECT_VERSION
echo ""