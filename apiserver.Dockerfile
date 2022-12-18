## API server ##
FROM go:1.19-alpine
WORKDIR /apiserver

# Bring Go source files into container
COPY cmd ./cmd
COPY internal/nosql ./internal/nosql
COPY internal/sql ./internal/sql
COPY internal/apiserver ./internal/apiserver

# Install only the required dependencies
COPY go.mod ./
COPY go.sum ./
RUN go mod tidy
RUN go mod download

# Run on port 8008
RUN go build -o /apiserver
EXPOSE 8080
CMD ["/apiserver"]