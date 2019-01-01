# Usage

The deployment consists of three docker containers (ox-web, ox-backend. ox-mysql) which are configured in the
[./docker-compose.yml]() file. 

## Prerequisites

The deployment depends on the nginx/letsencrypt setup [https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion]() which provides
a nginx reverse proxy which can handle https and forward to several docker services. The hostname to use can be configured using environment
variables.

To make communication work define a bridge network (e.g. _proxynet_) and attach it to the nginx reverse proxy container created above. The
docker compose setup will attach the web endpoint container to this network. 


## Configuring

The deployment can be configured by copying [./env.template]() to _.env_ and setting the 
corresponding variables. 

# Build infrastructure overview

## Git Repositories

All repositories are in the group https://github.com/eikek-ox/

* **ox**: Top level documentation and start up scripts (docker-compose)
* **ox-common**: Source of the docker base image eikek/ox-common which is used by the two other images
* **ox-web**: Source of the docker image eikek/ox-web
* **ox-backend**: Source of the docker image eikek/ox-backend

## Docker builds and repositories

Docker images are hosted at dockerhub.com within the eikek account. There is one docker repository
for each of the three docker images. The repositories are linked to the corresponding github repositories
so that they automatically build in case of an update in the git repository.

However they do **NOT** automatically build on other changes (OX releases, new releases of the base images).
So the builds should be triggered manually - building eikek/ox-common first.

* https://cloud.docker.com/u/eikek/repository/docker/eikek/ox-common
* https://cloud.docker.com/u/eikek/repository/docker/eikek/ox-web
* https://cloud.docker.com/u/eikek/repository/docker/eikek/ox-backend


