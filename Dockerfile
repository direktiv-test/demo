FROM docker.io/library/golang:1.24.0 AS builder

COPY go.mod src/go.mod
# COPY go.sum src/go.sum
RUN cd src/ && go mod download

COPY pkg src/pkg/
COPY cmd src/cmd/

RUN --mount=type=cache,target=/root/.cache/go-build cd src &&  \
    CGO_ENABLED=false go build -o /server \
    cmd/main.go

FROM ubuntu:25.10

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /server /server

CMD ["/server"]