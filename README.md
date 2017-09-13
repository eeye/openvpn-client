# Docker OpenVPN Client

1. You should add the generated openvpn client config to a directory, you can call it client.ovpn
2. Run the following, I recommend adding `--auth-nocache`

```
docker run -d --name vpn-client \
  --cap-add=NET_ADMIN \
  --device /dev/net/tun \
  -v /path/with/vpn/configs:/vpn \
  ebey/openvpn-client --config /vpn/client.ovpn --auth-nocache
```

### Route container traffic

Use `--net=container:<container-id>` -- routes available by the VPN client will be made available to the container.

```
docker run -it --rm \
  --net=container:vpn-client
  ubuntu /bin/bash
```