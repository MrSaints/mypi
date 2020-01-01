# mypi

_A work in progress._

A terrible excuse for a Python pun, but really, a repository for my Raspberry Pi, and general homelab stuff.


## Notes

- If using LAN-to-WAN, no changes to DHCP on the secondary router is needed
- If using LAN-to-LAN (recommended), disable DHCP on the secondary router, set the secondary router IP to the highest in the subnet, and probably reboot everything
- Configure the router DNS to use Pi-hole!


## TODO

- [ ] Set-up NAS (order SSD)
- [ ] Set-up Restic for backups
