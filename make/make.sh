#!/bin/bash
source make/registry-up.sh
source make/minikube-init.sh
source make/run-pipeline.sh ## configure seu KUBE_PATH='/mnt/c/Users/****/.kube' antes de executar 
source make/kube-create.sh ## Em ultimo caso, se seu kubectl e minikube estiverem configurados no windows e nao no wsl2, pode ser necessario usar o make/kube-create.sh no GitBash