FROM node:boron
MAINTAINER Eng-Shien Wu <engshien.wu@ijji.com>

ARG BITGO_VERSION=4.18.1
LABEL GF_APP_NAME=bitgo-express \
      GF_APP_VERSION=${BITGO_VERSION:-latest}

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date="$BUILD_DATE "\
      org.label-schema.docker.dockerfile="Dockerfile" \
      org.label-schema.license="MIT" \
      org.label-schema.name="Docker Bitgo-Express" \
      org.label-schema.vcs-ref="$VCS_REF" \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/iJJi/docker-bitgo-express" \
      org.label-schema.vendor="Ijji, inc." \
      org.label-schema.version="$BITGO_VERSION"

EXPOSE 3080

WORKDIR /usr/src/app

# "test" or "prod" (instead of "production")
ENV BITGO_ENV=test

RUN git clone --branch "$BITGO_VERSION" "https://github.com/BitGo/BitGoJS" . && npm install

USER nobody
CMD node bin/bitgo-express --env "$BITGO_ENV" --bind 0.0.0.0 --port 3080
