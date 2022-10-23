# HTTPS Localhost Container

HTTPS for localhost using [mkcert](https://github.com/FiloSottile/mkcert)

[![Docker Image Version](https://img.shields.io/docker/v/konstfish/https-localhost)](https://hub.docker.com/repository/docker/konstfish/https-localhost)

## Setup
```bash
brew install mkcert
brew install nss # for firefox

mkdir -p ~/mkcert
cd ~/mkcert

mkcert -install
mkcert localhost
```

## Build
```
git clone https://github.com/konstfish/https-localhost
cd https-localhost
docker build -t konstfish/https-localhost .
```

## Running with Standalone Containers

`docker run -v ~/mkcert:/certs -p 80:80 -p 443:443 -e PORT=3000 -d konstfish/https-localhost`

## Running in docker-compose
```yaml
services:
  https-localhost:
    image: konstfish/https-localhost
    volumes:
      - ~/mkcert:/certs
    ports:
      - 443:443
      - 80:80
    links:
      - frontend
    environment:
      HOST: frontend
      PORT: 3000
    restart: always
```