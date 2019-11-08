#!/bin/bash

docker network create phippy

docker run -d --net phippy --name etcd quay.io/coreos/etcd:v3.3.4 \
           /usr/local/bin/etcd --advertise-client-urls http://0.0.0.0:2379 --listen-client-urls http://0.0.0.0:2379

docker run -d -p 31380:80 --net phippy --name phippy local/phippy:1.0