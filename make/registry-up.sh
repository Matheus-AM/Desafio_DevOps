#!/bin/bash
docker run -d -p 5000:5000 --restart always --name registry registry:3
docker ps
