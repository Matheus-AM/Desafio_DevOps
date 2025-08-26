#!/bin/sh
sudo mkdir -p /etc/docker
echo '{ "insecure-registries": ["172.18.0.2:5000"] }' | sudo tee /etc/docker/daemon.json
sudo systemctl restart docker
