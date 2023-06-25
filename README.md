# Michael's Homelab

## Hosts 

| Host | OS   | Services |
| :--- | :--- | :------- |
| Cuddlefish | ![CentOS](https://img.shields.io/badge/centos%207-002260?style=for-the-badge&logo=centos&logoColor=F0F0F0) | Gitea |
| Rocktiplex | ![Rocky Linux](https://img.shields.io/badge/-Rocky%20Linux%209-%2310B981?style=for-the-badge&logo=rockylinux&logoColor=white) | Fathom |

<!-- To be created -->
<!-- | Cloud8 | ![Rocky Linux](https://img.shields.io/badge/-Rocky%20Linux%209-%2310B981?style=for-the-badge&logo=rockylinux&logoColor=white) | NextCloud | -->

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

## Backup Decryption Notes

Everything is encrypted with [age](https://github.com/FiloSottile/age).

All keys are generated using age-keygen and stored in a text file, e.g.

**backup-key.txt**

```
# created: 2023-06-24T18:01:36-07:00
# public key: age12345...
AGE-SECRET-KEY-xyz123...
```

Decrypting a file:

```
age -d -i backup-key.txt -o NAME.tar.gz NAME.tar.gz.enc
```

