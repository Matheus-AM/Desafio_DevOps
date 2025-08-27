#!/bin/bash
export PROJECT_NAME="getting-started"
export PROJECT_VERSION="1.0.0-SNAPSHOT"
export REGISTRY_PATH="172.18.0.2:5000"
export ENVIROMENT="des"
cp "local-pipelines/k8s/namespace.yaml" "local-pipelines/k8s/$PROJECT_NAME-namespace.yaml"
cp "local-pipelines/k8s/deployment.yaml" "local-pipelines/k8s/$PROJECT_NAME-deployment.yaml"
cp "local-pipelines/k8s/service.yaml" "local-pipelines/k8s/$PROJECT_NAME-service.yaml"
source local-pipelines/utils/replace-tokens.sh "local-pipelines/k8s/$PROJECT_NAME-namespace.yaml"
source local-pipelines/utils/replace-tokens.sh "local-pipelines/k8s/$PROJECT_NAME-deployment.yaml"
source local-pipelines/utils/replace-tokens.sh "local-pipelines/k8s/$PROJECT_NAME-service.yaml"

kubectl apply --validate=false -f "$(pwd)/local-pipelines/k8s/$PROJECT_NAME-namespace.yaml"
kubectl apply --validate=false -f "$(pwd)/local-pipelines/k8s/$PROJECT_NAME-deployment.yaml"
kubectl apply --validate=false -f "$(pwd)/local-pipelines/k8s/$PROJECT_NAME-service.yaml"
minikube tunnel