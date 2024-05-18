# Dockerfile for a Go application
FROM golang:1.17

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files
COPY go.mod main.go ./

# Download and install Go dependencies
RUN go mod download
RUN go get mi_proyecto

# Build the Go application
RUN go build -o myapp

# Expose the port that the application will run on
EXPOSE 8080

# Command to run the application
CMD ["./myapp"]
