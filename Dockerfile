FROM golang:1.13 as builder
LABEL maintainer="sh0e1 <sh0e1@users.noreply.github.com>"

WORKDIR /go/src/app
COPY . .

ARG version
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-X main.version=$version" -v -o app

FROM alpine
RUN apk add --no-cache ca-certificates

COPY --from=builder /go/src/app/app /app

CMD ["/app"]
