#!/bin/bash

docker run -d -p 4001:4001 --net phippy --name etcd quay.io/coreos/etcd:3.4.3
docker run -d -p 31380:80 --net phippy --name phippy local/phippy