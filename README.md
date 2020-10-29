1. `curl -sL https://github.com/CodeDistillery/hyperion-device-setup/archive/master.tar.gz | tar xz`
2. Configure hostname
   1. `sudo raspi-config`
   2. Select Network Options
   3. Select Hostname
3. `sudo update-alternatives --set iptables /usr/sbin/iptables-legacy`
4. `sudo reboot`
5. `cd hyperion-device-setup-master && bash setup.sh`
6. `sudo reboot`
7. Login as new user
8. `sudo deluser -remove-home pi`
