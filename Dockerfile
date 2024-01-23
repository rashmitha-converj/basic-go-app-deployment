FROM golang:1.17-alpine as build

WORKDIR /app

COPY . . 

RUN go mod download

RUN go build -o ./server 

RUN ls

FROM scratch

# Copy the compiled binary from the build stage
COPY --from=build /app/server /app

RUN ls

# Set the entrypoint for the container to run the binary
ENTRYPOINT ["/app"]
