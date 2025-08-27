#!/bin/bash
docker network create --driver=bridge --subnet=172.18.0.0/16 --gateway=172.18.0.1 registry-net
docker run -d --name registry --network=registry-net --ip=172.18.0.2 -p 5000:5000 registry:3
docker ps
### pegar ip do registry 
#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' registry
