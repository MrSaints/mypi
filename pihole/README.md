# pihole

```
./run.sh
```

If upgrading, ensure to run `docker pull pihole/pihole:$VERSION` / `docker-compose pull` first to save time starting the new version.

The admin panel is configured to be accessed via Traefik at `pihole.home.local`.

Initial password in logs.


## Less Writes

Set `DBINTERVAL=60` in `etc-pihole/pihole-FTL.conf`.

And, disable query logging in system settings.


## Custom Routing

To route all requests from `*.home.local` to an internal IP address, create `10-home-local.conf` inside `etc-dnsmasq.d` with the following contents _(change accordingly)_:

```
address=/.home.local/192.168.1.30
```
