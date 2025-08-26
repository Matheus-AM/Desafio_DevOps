#!/bin/bash
docker network create registry-net
docker run -d -p 5000:5000 --name registry --network registry-net registry:3
docker ps
### pegar ip do registry 
#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' registry
