# Homelab

## Hosts & Services

### Cuddlefish

- `git.michaellisano.com`

### Rocktiplex

- `analytics.michaellisano.com`


## Dockerized Cloudflared Notes

If a docker-compose file looks like this:

```yaml
services:
  gitea-server:
    image: gitea/gitea:1.19.3
    ...
  gitea-cloudflared:
    image: cloudflare/cloudflared
    ...
```

The name of the target services is `gitea-server`, and (per Docker's networking shenanigans), should be specified **directly by service name,** e.g.

```
https://git.michaellisano.com -> http://gitea-server:3000
```

