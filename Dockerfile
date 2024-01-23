FROM 381492123764.dkr.ecr.eu-north-1.amazonaws.com/go-app-images:new as build

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . . 

RUN go build -o ./server 

RUN ls

FROM alpine

# Copy the compiled binary from the build stage
COPY --from=build /app/server /app

# Set the entrypoint for the container to run the binary
ENTRYPOINT ["/app"]
