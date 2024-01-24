FROM 381492123764.dkr.ecr.eu-north-1.amazonaws.com/base-image:golangalpine-base as build

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . . 

RUN go build -o ./server 

RUN ls

FROM 381492123764.dkr.ecr.eu-north-1.amazonaws.com/base-image:alpinebase1

# Copy the compiled binary from the build stage
COPY --from=build /app/server /server

# Set the entrypoint for the container to run the binary
ENTRYPOINT ["/server"]
