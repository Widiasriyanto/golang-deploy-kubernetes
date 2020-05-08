FROM golang:alpine as builder
RUN apk update && apk add busybox-extras
WORKDIR /go
COPY . .
RUN go build -o main

FROM alpine
WORKDIR /go
COPY --from=builder /go .
