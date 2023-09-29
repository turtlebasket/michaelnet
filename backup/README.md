# Generic Backup Host

## Crontab

Runs on the second of every month.

```
0 0 2 * * cd /home/USER/backups && bash prune.sh
```

## Filename Pattern

Container volume backups are of the format:

```
gitea-data-2023-06-17_050002.tar.gz.enc
^          ^                ^
|          |                Backups are encrypted tarballs
|          |
|          ISO Datetime separated by _
|
Container volume name (*-data)
```

Regex to match backups that are *not* from the first of every month, using the above format:

```
[0-9A-Za-z]+-data-[0-9]{4}-[0-9]{2}-([^0][0-9]|[0-9][^1])_.*
```

