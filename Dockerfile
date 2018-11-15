FROM golang:alpine
MAINTAINER Alexandre Ferland <aferlandqc@gmail.com>

RUN apk add --no-cache git

ADD . /go/src/github.com/admiralobvious/tinysyslog
WORKDIR /go/src/github.com/admiralobvious/tinysyslog

RUN go-wrapper download
RUN go-wrapper install

EXPOSE 5140 5140/udp

CMD ["/go/bin/tinysyslog", "--address", "0.0.0.0:5140"]
