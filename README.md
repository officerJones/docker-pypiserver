Docker minidlna image
===
[![Build Status](https://travis-ci.org/officerJones/docker-pypiserver.svg?branch=master)](https://travis-ci.org/officerJones/docker-pypiserver)  
An image to run a pypiserver from within docker.
## Usage
### Docker-compose
1. Set host volume in docker-compose.yml as desired.
2. Set host ip in healthcheck of docker-compose.yml as desired.
3. Run docker-compose 
```sh
	docker-compose up -d
```
### Docker
1. Run docker with volume and host  
```sh
	docker run -v </your/repo/path>:/data/packages --name pypiserver -p 8080:8080 officerjones/pypiserver
```
## Build
The image is built for arm architecture on a Raspberry Pi 3 B+.
You can build on your own platform using the Dockerfile for other architectures.
```sh
	docker build --tag <yourtag:yourversion> .
```