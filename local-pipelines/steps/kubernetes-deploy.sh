#!/bin/bash
echo -e "\e[32mDeploy Kubernetes\e[0m"
echo ""
export REGISTRY_PATH='172.18.0.2:5000'
for file in $(ls local-pipelines/k8s); do
    source "$WORKDIR/local-pipelines/utils/replace-tokens.sh" "$WORKDIR/local-pipelines/k8s/$file"
    echo "---------"
    echo ""
    cat "$WORKDIR/local-pipelines/k8s/$file"
    echo ""
done

source kubectl apply -f "$WORKDIR/local-pipelines/k8s/namespace.yaml"
source kubectl apply -f "$WORKDIR/local-pipelines/k8s/deployment.yaml"
source kubectl apply -f "$WORKDIR/local-pipelines/k8s/service.yaml"

echo ""
