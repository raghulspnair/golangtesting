# Stage 1: Build the Go binary
FROM golang:1.24-alpine AS builder
  
WORKDIR /app
COPY . .
COPY go.mod go.sum ./
RUN go build -o app testing.go

# Stage 2: Run the app using a tiny image
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/app .

EXPOSE 8080
CMD ["./app"]

