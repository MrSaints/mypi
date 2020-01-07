# samba

**Mount External Volume:**

1. Find device: `sudo lsblk --fs`
2. Add a new entry to `/etc/fstab`:

```
UUID=<UUID of device> /mnt/<mounted directory> ext4 defaults,auto,users,rw,nofail 0 1
```

3. Run `sudo mount /mnt/<mounted directory>` (it will automatically figure out which device to use)

**Global Configuration (ideal for MacOS):**

Modify `/etc/samba/smb.conf`:

```
# https://wiki.samba.org/index.php/Configure_Samba_to_Work_Better_with_Mac_OS_X
[global]
    allow insecure wide links = yes
    follow symlinks = yes
    wide links = yes

    min protocol = SMB2
    vfs objects = catia fruit streams_xattr
    fruit:metadata = stream
    fruit:model = MacSamba
    fruit:posix_rename = yes
    fruit:veto_appledouble = no
    fruit:wipe_intentionally_left_blank_rfork = yes
    fruit:delete_empty_adfiles = yes
```

**Shared Volume:**

1. Create shared user group: `sudo groupadd shared`
2. Add user to shared group: `sudo usermod -a -G shared <user>`
3. Change group ownership of directory: `sudo chgrp shared <directory>`
4. Change group permissions of directory: `sudo chmod g+rwx <directory>`
5. Apply config below to `/etc/samba/smb.conf`:

```
[shared]
    path = /mnt/<mounted directory>/shared
    writeable = Yes
    create mask = 0777
    directory mask = 0777
    public = no
```

**User Data Directory:**

1. `sudo useradd -m <user>`
2. `mkdir -p /mnt/<mounted directory>/<user>/`
3. Ensure the data directory has appropriate ownership, and permissions for `<user>`
4. Symlink user's data directory to user's home directory for simplicity:

```
sudo ln -s  /mnt/<mounted directory>/<user>/ /home/<user>/data
```
