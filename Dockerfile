## API server ##
FROM go:1.19-alpine
WORKDIR /api_server

# Bring Go source files into container
COPY go.mod ./
COPY go.sum ./
COPY cmd ./cmd
COPY internal ./cmd

# Install dependencies and build server
RUN go mod download
RUN go build -o /api_server

# Run on port 8008
EXPOSE 8080
CMD ["/api_server"]