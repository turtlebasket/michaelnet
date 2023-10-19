# Michael's Homelab

## Host List

### Devices

| Host | OS   | Purpose / Services |
| :--- | :--- | :----------------- |
| [Thonkpad](thonkpad/) (portable) | ![Fedora](https://img.shields.io/badge/Fedora_37-294172?style=for-the-badge&logo=fedora&logoColor=white) | Misc. Projects |
| [Cuddlefish](cuddlefish/) | ![CentOS](https://img.shields.io/badge/centos_7-002260?style=for-the-badge&logo=centos&logoColor=F0F0F0) | Gitea |
| [Rocktiplex](rocktiplex/) | ![Rocky Linux](https://img.shields.io/badge/-Rocky%20Linux_9-%2310B981?style=for-the-badge&logo=rockylinux&logoColor=white) | Fathom, Status Proxy, RSF Analytics |
| Cloud8 (under repair) | ![Rocky Linux](https://img.shields.io/badge/-Rocky%20Linux_9-%2310B981?style=for-the-badge&logo=rockylinux&logoColor=white) | NextCloud |

### Virtualized Hosts

| VM   | Kind | Machine | OS   | Purpose / Services |
| :--- | :--- | :------ | :--- | :----------------- |
| [NixHost](thonkpad/nixhost/) | KVM | Thonkpad | ![NixOS](https://img.shields.io/badge/NIXOS-5277C3.svg?style=for-the-badge&logo=NixOS&logoColor=white) | NixOS Testbed |

### Off-site

| Host | Provider | OS   | Purpose / Services |
| :--- | :------- | :--- | :----------------- |
| Backup1 | [TNAHosting](https://tnahosting.net/) | ![Ubuntu](https://img.shields.io/badge/Ubuntu_22.04_LTS-E95420?style=for-the-badge&logo=ubuntu&logoColor=white) | Docker Volume Backups |

## Docker 

Most services are run as Docker containers.

### Volume Permission Notes

In a standard setup, we will have a `docker` usergroup. To make a *user-created directory* usable as a volume, run the following:

```bash
sudo chown -R my-user:docker my-dir
```

### SELinux Notes

Docker volumes violate some SELinux policies. Use `setenforce 0` to disable it temporarily, or make the following permanent change to `/etc/sysconfig/selinux`:

```bash
# SELINUX=enforcing
SELINUX=permissive
```

### Dockerized Cloudflared Notes

If a docker-compose file looks like this:

```yaml
services:
  gitea-server:
    image: gitea/gitea:1.19.3
    # ...
  gitea-cloudflared:
    image: cloudflare/cloudflared
    # ...
```

Then in this case the name of the target service is `gitea-server`, and (per Docker's networking shenanigans), should be specified **directly by service name,** e.g.

```
https://git.michaellisano.com -> http://gitea-server:3000
```

## Backups

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

