FROM golang:1.17-alpine as build

WORKDIR /app

COPY . . 

RUN go build -o /server 

FROM scratch

# Copy the compiled binary from the build stage
COPY --from=build /app/server /app

# Set the entrypoint for the container to run the binary
ENTRYPOINT ["/app"]
