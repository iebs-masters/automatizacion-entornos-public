FROM golang:1.17

WORKDIR /app

COPY go.mod main.go ./

RUN go build -o api

EXPOSE 8080

CMD ["./api"]
