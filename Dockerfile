FROM golang:1.15.3 as builder

ENV GO111MODULE=on

ENV GOPROXY=https://goproxy.cn,direct

WORKDIR /src

COPY .  .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build  -o app .

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /src/app .

CMD ["./app"]