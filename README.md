# mypi

_A work in progress._

A terrible excuse for a Python pun, but really, a repository for my Raspberry Pi, and general homelab stuff.


---


## Current Set-up

- Raspberry Pi 4 (4 GB)
- Argon ONE M.2
- WD Blue 3D NAND Internal SSD M.2 SATA 500 GB
- SanDisk Extreme Pro 32 GB microSDHC Memory Card (Unused / Backup)
- Powered USB Hub
- Portable SSD T5 1 TB USB 3.1 External SSD (Additional)


## Notes

### Install Pi OS

```
sudo apt update && sudo apt install rpi-imager

sudo fdisk -l

rpi-imager --cli
```

### Headless Set-up

1. Enable SSH (disabled by default)

Create `ssh` file in root of boot.

2. Auto-join WiFi

Create `wpa_supplicant.conf` in root of boot:

```
country=GB
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    scan_ssid=1
    ssid="WiFi_SSID_Here"
    psk="WiFi_Password_Here"
}
```

### Change Password

```
passwd
```

### Disable SSH w/ Password

```
# Set `MaxAuthTries 3`
# Set `PasswordAuthentication no`
sudo nano /etc/ssh/sshd_config
sudo /etc/init.d/ssh restart
```

### Changing Boot Order

```
# "Advanced Options"
sudo raspi-config
```

### Router

- If using LAN-to-WAN, no changes to DHCP on the secondary router is needed
- If using LAN-to-LAN (recommended), disable DHCP on the secondary router, set the secondary router IP to the highest in the subnet, and probably reboot everything
- Configure the router DNS to use Pi-hole!

### Testing

- To test the local network:
    - Run `iperf -s` on the Pi
    - Run `iperf -c <Pi address>` on the client
- To test the internet connection:
    - Run `speedtest-cli`

### Rsync

```
# -n for dry-run
rsync -avP -n --exclude=.DS_Store --exclude=Thumbs.db /from/ /to
```

### Misc.

- Fix SSH permissions: `sudo chmod 600 ~/.ssh/authorized_keys && chmod 700 ~/.ssh/`
