FROM golang:alpine

LABEL "com.github.actions.name"="reveiwdog for Golang"
LABEL "com.github.actions.description"="a reviewdog in a cage"
LABEL "com.github.actions.icon"="message-circle"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="http://github.com/izumin5210/actions-reviewdog"
LABEL "homepage"="http://github.com/actions-reviewdog"
LABEL "maintainer"="Masayuki Izumi <m@izum.in>"

RUN apk add -U --no-cache build-base git

ENV GO111MODULE on
RUN go get github.com/izumin5210/reviewdog/cmd/reviewdog@izumin5210/actions
RUN go get github.com/izumin5210/gex/cmd/gex@v0.4.5

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
