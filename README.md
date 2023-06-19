# Michael's Homelab

## Hosts & Services

### Cuddlefish

![CentOS](https://img.shields.io/badge/centos%207-002260?style=for-the-badge&logo=centos&logoColor=F0F0F0)

- `git.michaellisano.com`

### Rocktiplex

![Rocky Linux](https://img.shields.io/badge/-Rocky%20Linux%209-%2310B981?style=for-the-badge&logo=rockylinux&logoColor=white)

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

Then in this case the name of the target service is `gitea-server`, and (per Docker's networking shenanigans), should be specified **directly by service name,** e.g.

```
https://git.michaellisano.com -> http://gitea-server:3000
```

