1. `git clone https://github.com/CodeDistillery/hyperion-device-setup.git`
2. Configure `local.json` file
3. Configure hostname
   1. `sudo raspi-config`
   2. Select Network Options
   3. Select Hostname
4. `sudo update-alternatives --set iptables /usr/sbin/iptables-legacy`
5. `sudo reboot`
6. `bash setup.sh`
7. `sudo reboot`
8. Login as new user
9. `sudo deluser -remove-home pi`
