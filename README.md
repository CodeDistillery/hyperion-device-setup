1. `git clone https://github.com/CodeDistillery/hyperion-device-setup.git`
2. Configure hostname
   1. `sudo raspi-config`
   2. Select Network Options
   3. Select Hostname
3. `sudo update-alternatives --set iptables /usr/sbin/iptables-legacy`
4. `sudo reboot`
5. `bash setup.sh`
6. `sudo reboot`
7. Login as new user
8. `sudo deluser -remove-home pi`
