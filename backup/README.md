# Generic Backup Host

## Crontab

Runs on the second of every month.

```
0 0 2 * * cd /home/USER/backups && bash prune.sh
```

## Filenames

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

## Matching

Regex to match backups that are *not* from the first of every month:

```
.*-data-\d{4}-\d{2}-([^0][0-9]|[0-9][^1])_.*
```

