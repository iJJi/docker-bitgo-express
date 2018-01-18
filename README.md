# docker-bitgo-express
A docker container for [bitgo express](https://github.com/BitGo/BitGoJS)

It's on [docker-hub](https://hub.docker.com/r/fingershock/bitgo-express/) and [github](https://github.com/iJJi/docker-bitgo-express)

## tags and links
 * `latest` [(Dockerfile)](https://github.com/ijji/docker-bitgo-express/blob/master/Dockerfile) [![](https://images.microbadger.com/badges/image/fingershock/bitgo-express.svg)](https://microbadger.com/images/fingershock/bitgo-express "Get your own image badge on microbadger.com") [![Build Status](https://travis-ci.org/iJJi/docker-bitgo-express.svg?branch=master)](https://travis-ci.org/iJJi/docker-bitgo-express)

## running

To run in test mode
```sh
docker run -P fingershock/bitgo-express
```

To run in production mode
```sh
docker run -e BITGO_ENV=prod -P fingershock/bitgo-express -d --restart always
```

