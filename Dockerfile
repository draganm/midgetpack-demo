FROM golang:1.9.2 as build
RUN mkdir -p /go/src/github.com/draganm/midgetpack-demo
WORKDIR /go/src/github.com/draganm/midgetpack-demo
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go install .

FROM dmilhdef/midgetpack:v2.0 as encrypt
ARG KEY
COPY --from=build /go/bin/midgetpack-demo /
RUN /midgetpack  -p -P $KEY /midgetpack-demo -o /midgetpack-demo-encrypted

FROM alpine:3.6
COPY --from=encrypt /midgetpack-demo-encrypted /midgetpack-demo
CMD ["/midgetpack-demo"]
