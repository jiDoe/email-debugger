FROM elixir:1.12.2-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache inotify-tools git && \
    mkdir -p /home/user/app

WORKDIR /home/user/app

RUN mix do local.rebar --force, local.hex --force
