#!/bin/bash

. config
docker run --name ${name} \
  --network=host \
  --add-host ${name}:127.0.1.1 \
  -v $(dirname $(realpath ${BASH_SOURCE[0]}))/share:/share \
  -h ${name} \
  -d \
  --privileged \
  -it ${repo}

#  --restart always \
#  --entrypoint /work/entrypoint.sh \
