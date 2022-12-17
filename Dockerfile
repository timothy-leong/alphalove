# API server
FROM go:1.19-alpine
WORKDIR /api_server

COPY go.mod ./
COPY go.sum ./

RUN go mod download