FROM golang:1.15.3 as builder

#WORKDIR /go/src/github.com/alexellis/href-counter/
WORKDIR /src

COPY .  .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o app .
#RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm  go build -a -installsuffix cgo -o app .
#RUN go build -o app .

FROM alpine:latest

WORKDIR /root/

#COPY --from=0 /go/src/github.com/alexellis/href-counter/app .
COPY --from=builder /src/app .
CMD ["./app"]