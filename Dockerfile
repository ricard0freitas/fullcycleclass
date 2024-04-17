FROM golang:1.22-alpine AS build

WORKDIR /usr/src/app
COPY go.mod .
RUN go mod download
COPY . .

RUN go build -o hello

FROM scratch
COPY --from=build /usr/src/app/hello .

ENTRYPOINT ["./hello"]


