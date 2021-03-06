#!/bin/bash

if docker --version 2>/dev/null; then
     printf " + Docker found!\n";
else
     printf " >>> ERROR: docker command not found. Install docker first.\n\n"; exit 1;
fi

if docker ps -a 2>/dev/null; then
     printf " + dockerd ps success.\n";
else
     printf " >>> ERROR: dockerd not working? Check docker status\n\n"; exit 1;
fi

DOCKER_PS=$(docker ps -a -q -f name=cifrexdb)
if [ -n "$DOCKER_PS" ]; then
    docker stop $DOCKER_PS
else
     printf " WARNING: cifrexdb  not found\n";
fi

DOCKER_PS=$(docker ps -a -q -f name=cifrexweb)
if [ -n "$DOCKER_PS" ]; then
    docker stop $DOCKER_PS
    printf "SUCCESS: cifrex's containers has been STOPPED!\n";
else
     printf " WARNING: cifrexweb not found\n";
fi

