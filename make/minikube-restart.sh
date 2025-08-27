#!/bin/bash
minikube delete
minikube start --driver=docker --insecure-registry="172.18.0.2:5000"
docker network connect registry-net minikube
minikube ssh -- 'sudo mkdir -p /etc/docker' 
minikube ssh -- 'echo "{ \"insecure-registries\":[\"172.18.0.2:5000\"] }" | sudo tee /etc/docker/daemon.json'
