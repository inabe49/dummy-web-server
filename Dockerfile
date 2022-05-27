FROM golang:1.18-alpine3.15 AS builder


WORKDIR /go/src/github.com/inabe49/dummy-web-server/

COPY go.mod go.sum main.go ./
RUN go build .


FROM alpine:3.15

LABEL  maintainer "Toshiaki Inahata <darwin49@gmail.com>"

WORKDIR /go/src/github.com/inabe49/dummy-web-server/

COPY --from=builder /go/src/github.com/inabe49/dummy-web-server ./

EXPOSE 9000

# CMD systemctl enable memon && systemctl start memon
ENTRYPOINT [ "sh", "-c", "./dummy-web-server-temp" ]
