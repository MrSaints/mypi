# restic

Backblaze B2 repositories are set-up per user. This corresponds to one private bucket per user.

The set-up is as simple as:

1. Create a B2 bucket
2. Create application credentials for the bucket
3. Configure:

```bash
export B2_ACCOUNT_ID=""
export B2_ACCOUNT_KEY=""
export RESTIC_REPOSITORY="b2:<bucket name>"
```

4. Run `restic init`
5. Enter a password for encrypting the backups

And to backup:

```
restic backup <directory>
```
