FROM golang:alpine AS builder
ADD main.go /go
RUN go env -w GO111MODULE=auto CGO_ENABLED=0 \
  && go build -o main

FROM scratch
WORKDIR /
COPY --from=builder /go/main /main
EXPOSE 3000
ENTRYPOINT ["/main"]
