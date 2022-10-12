# HTTPS Localhost Container

HTTPS for localhost using [mkcert](https://github.com/FiloSottile/mkcert)

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