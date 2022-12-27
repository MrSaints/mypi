# traefik

```
./run.sh
```

The admin panel is configured to be accessed via Traefik at `traefik.home.local`.

## TLS

This Traefik's config was set-up to work with local certificates generated from `mkcert`.

See https://github.com/FiloSottile/mkcert for installation.

Once installed, run in this directory:

```
mkcert -install

mkcert -cert-file certs/local-cert.pem -key-file certs/local-key.pem "home.local" "*.home.local"
```
