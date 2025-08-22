#!/bin/bash
docker run -d -p 5000:5000 --restart always --name registry registry:3
docker ps
# docker tag minha-imagem:latest meu-registro.local:5000/minha-imagem:latest
# docker login meu-registro.local:5000
# docker push meu-registro.local:5000/minha-imagem:latest
