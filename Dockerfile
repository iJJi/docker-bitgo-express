# Can't use mhart/alpine-node as Secp256k1 has a dependency on glibc
FROM node:boron
MAINTAINER Eng-Shien Wu <engshien.wu@ijji.com>

ENV BITGO_VERSION=4.17.1
LABEL GF_APP_NAME=bitgo-express \
      GF_APP_VERSION=${BITGO_VERSION:-latest}

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="Dockerfile" \
      org.label-schema.license="MIT" \
      org.label-schema.name="Docker BitGo-Express" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/iJJi/docker-bitgo-express" \
      org.label-schema.vendor="Ijji, inc." \
      org.label-schema.version=$BITGO_VERSION

EXPOSE 3080

# "test" or "prod" (instead of "production")
ENV BITGO_ENV=test

# Option --unsafe installs files as root
RUN npm install -g --unsafe "bitgo@$BITGO_VERSION"

USER nobody
CMD /usr/local/lib/node_modules/bitgo/bin/bitgo-express --env "$BITGO_ENV" --bind 0.0.0.0 --disablessl
