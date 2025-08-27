#!/bin/bash
WORKDIR=$(pwd)
echo -e "\e[32mBuild Quarkus\e[0m"
echo ""

./mvnw package -Pnative

### binario
# ./mvnw package -Pnative ## build
# "./target/$PROJECT_NAME-$PROJECT_VERSION-runner" ## run

### jar
# ./mvnw package ## build
# ./mvnw quarkus:dev ## run
echo ""
