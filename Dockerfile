FROM alpine

ENTRYPOINT ["openvpn"]
VOLUME ["/vpn"]

RUN apk add --no-cache openvpn
RUN apk add --no-cache openssh
RUN apk add --no-cache rsync