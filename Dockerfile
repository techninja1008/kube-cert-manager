FROM golang

WORKDIR /build
COPY . .
RUN ./build.sh

FROM alpine:3.5
RUN apk --no-cache add ca-certificates
ADD --from 0 kube-cert-manager /kube-cert-manager
ENTRYPOINT ["/kube-cert-manager"]
