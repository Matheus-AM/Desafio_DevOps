#!/bin/bash
echo -e "\e[32mDeploy Kubernetes\e[0m"
echo ""

minikube ssh -- 'sudo mkdir -p /etc/docker && echo "{ \"insecure-registries\":[\"<IP_DO_HOST>:5000\"] }" | sudo tee /etc/docker/daemon.json && sudo systemctl restart docker'

for file in $(ls local-pipelines/k8s); do
    source "$WORKDIR/local-pipelines/utils/replace-tokens.sh" "$WORKDIR/local-pipelines/k8s/$file"
    kubectl apply -f "$WORKDIR/local-pipelines/k8s/$file"
done

echo ""
# kubectl aplly -f 
