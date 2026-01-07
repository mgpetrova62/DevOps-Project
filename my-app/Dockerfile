# Build Stage
FROM golang:1.25-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Final Stage
FROM alpine:latest  

LABEL maintainer="YourName" \
      project="Develop Simple REST Service" \
      version="1.0"

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /app/main .

ENV APP_PORT=80
EXPOSE ${APP_PORT}

CMD ["./main"]