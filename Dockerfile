FROM golang:1.21-alpine
WORKDIR /app
COPY . .
RUN go build -o app testing.go
EXPOSE 8080
CMD ["./app"]
