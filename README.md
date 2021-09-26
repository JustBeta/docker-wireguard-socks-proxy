# docker-wireguard-socks-proxy
Turn a wireguard connection into a lightweight SOCKS proxy server (alpine/wireguard/dante socks server)

# Usage:
## Run
```
docker run -d --name wireguard-socks-proxy \
    --cap-add=NET_ADMIN \
    -e "LOCAL_NETWORK=192.168.1.0/24" \
    -e "COUNTRY=Canada"  or -e "COUNTRYCODE=CA" \
    -e "PRIVATEKEY=sGDvYx+OX7fuALQVUt0TuhnJzVSscNfYsVouQR/HU1U=" \
    -v wgclient:/etc/wireguard/ \
    --sysctl net.ipv4.conf.all.src_valid_mark=1 \
    -p 1080:1080 \
    trananhtuan/wireguard-socks-proxy:latest
```
`/path/to/config/wg0.conf` is a wireguard configuration file.

This image requires wireguard kernel module has been installed and loaded on the host OS. In order to check that the WireGuard kernel module has loaded you can run `sudo modprobe wireguard`, if you get no output it’s all good.

iptables rules are added automatically during startup to prevent leaks.
## Build
```
git clone https://github.com/justbeta/docker-wireguard-socks-proxy
cd docker-wireguard-socks-proxy
docker build -t justbeta/wireguard-socks-proxy:latest .
```
