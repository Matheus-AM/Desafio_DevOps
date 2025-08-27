#!/bin/bash
echo -e "\e[32mSettup Enviroment\e[0m"
echo ""
export GRAALVM_VERSION=24.2.2.0
export JAVA_VERSION=21

source "$WORKDIR/local-pipelines/utils/replace-tokens.sh" "$WORKDIR/pom.xml"

curl -O -J -L "https://github.com/graalvm/mandrel/releases/download/mandrel-$GRAALVM_VERSION-Final/mandrel-java24-linux-amd64-$GRAALVM_VERSION-Final.tar.gz"
tar -xf mandrel-java24-linux-amd64-$GRAALVM_VERSION-Final.tar.gz
mv mandrel-java24-$GRAALVM_VERSION-Final /opt
export JAVA_HOME="/opt/mandrel-java24-$GRAALVM_VERSION-Final"
export GRAALVM_HOME="${JAVA_HOME}"
export PATH="${JAVA_HOME}/bin:${PATH}"
echo ""
