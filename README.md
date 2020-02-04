# 🐋 ilshidur/tor-relay

> Lightweight TOR relay image (12.94 MB), based on [LinuxServer.io Alpine Linux](https://linuxserver.io). Configurations can be passed as environment variables.

[![dockeri.co](https://dockeri.co/image/ilshidur/tor-relay)](https://hub.docker.com/r/ilshidur/tor-relay)

## Usage

### Bridge mode

```bash
docker run \
  -d \
  --name tor-relay \
  -e RELAY_TYPE=bridge \
  -e TOR_ORPort=9001 \
  -e TOR_Nickname=ididnteditheconfig \
  -e TOR_RelayBandwidthRate="100 KBytes" \
  -e TOR_RelayBandwidthBurst="200 KBytes" \
  -e TZ=Europe/London \
  -e PUID=$(id -u) \
  -e PGID=$(id -g) \
  -v $(pwd)/tor/data:/data:Z \
  -p 9001:9001 \
  --restart always \
  ilshidur/tor-relay
```

### Relay mode

```bash
docker run \
  -d \
  --name tor-relay \
  -e RELAY_TYPE=relay \
  -e TOR_ORPort=9001 \
  -e TOR_Nickname=ididnteditheconfig \
  -e TOR_RelayBandwidthRate="100 KBytes" \
  -e TOR_RelayBandwidthBurst="200 KBytes" \
  -e TZ=Europe/London \
  -e PUID=$(id -u) \
  -e PGID=$(id -g) \
  -v $(pwd)/tor/data:/data:Z \
  -p 9001:9001 \
  --restart always \
  ilshidur/tor-relay
```

### Exit node mode

**It is highly recommended against setting up this type of configuration in a home network.**

```bash
docker run \
  -d \
  --name tor-relay \
  -e RELAY_TYPE=exit \
  -e TOR_ORPort=9001 \
  -e TOR_Nickname=ididnteditheconfig \
  -e TOR_RelayBandwidthRate="100 KBytes" \
  -e TOR_RelayBandwidthBurst="200 KBytes" \
  -e TZ=Europe/London \
  -e PUID=$(id -u) \
  -e PGID=$(id -g) \
  -v $(pwd)/tor/data:/data:Z \
  -p 9001:9001 \
  --restart always \
  ilshidur/tor-relay
```

## Configuration

The configuration is stored in a `/etc/tor/torrc` file.
Everyline can be changed using environment variables as described below :

`TOR_<configuration>=<value>` will uncomment the first line starting with `<configuration>` and set its value to `<value>`.

*Example : setting `TOR_ORPort` to `9002` will change the line `#ORPort 9001` to `ORPort 9002`.*

## License

MIT

<hr/>

<p align="center">
  Don't forget to 🌟 Star 🌟 the repo if you like this Docker image !<br/>
  <a href="https://github.com/Ilshidur/tor-relay-docker/issues/new">Your feedback is appreciated</a>
</p>
