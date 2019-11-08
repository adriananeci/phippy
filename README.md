# phippy
Simple tutorial to build and deploy a simple Python app in Docker.


## Build a Docker image from existing Python source code and push it to Docker Hub. 

You need to replace DOCKER_HUB_USER with your Docker Hub username.
```
docker build -t <DOCKER_HUB_USER>/phippy .
docker push <DOCKER_HUB_USER>/phippy
```

## Launch the app using Docker
```
docker network create phippy
docker run -d -p 2379:2379 --net phippy --name etcd quay.io/coreos/etcd:3.3.4
docker run -d -p 31380:80 --net phippy --name phippy <DOCKER_HUB_USER>/phippy
```

Or you can use the existing scripts to build/push/run the app:

```
./docker_build.sh
./docker_push.sh
./docker_run.sh 
```

## Test the app
```
curl localhost:31380
```

## Launch the app with Docker Compose
```
docker-compose up -d 
```

## Scale up the app with Docker Compose
```
docker-compose up -d --scale web=5
```
