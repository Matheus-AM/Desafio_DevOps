#!/bin/bash
WORKDIR=$(pwd)
echo -e "\e[32mBuild Quarkus\e[0m"
echo ""


### binario
./mvnw package -Pnative
# "./target/$PROJECT_NAME-$PROJECT_VERSION-runner"

### jar
# ./mvnw package
# ./mvnw quarkus:dev
echo ""
