FROM alpine:latest

MAINTAINER Roustem <roustem@agilebits.com>

RUN apk add --no-cache \
    make \
    curl \    
    openssh-client \
    rsync \
    ruby \
    ruby-bundler \
    nodejs

RUN gem install --no-document sass

ENV HUGO_VERSION 0.19

RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \

    && curl -L https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-64bit.tar.gz | tar -xz \
    && mv hugo_*/hugo_* /usr/local/bin/hugo \
    && rm -rf hugo_* \

    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313