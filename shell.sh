#!/bin/sh
DOCKER_PS=$(docker ps -a -q -f name=cifrexweb)
docker exec -it $DOCKER_PS sh

