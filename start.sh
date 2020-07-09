#!/bin/bash

docker build -t name .
docker run --name server -it -p 80:80 -p 443:443 name