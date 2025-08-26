#!/bin/bash
# minikube start --extra-config=apiserver.authorization-mode=RBAC
minikube delete
minikube start --driver=docker --insecure-registry="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' registry):5000"
docker network connect registry-net minikube
