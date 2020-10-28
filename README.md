1. `curl https://raw.githubusercontent.com/CodeDistillery/hyperion-device-setup/master/setup.sh -o setup.sh && chmod +x setup.sh`
2. `curl https://raw.githubusercontent.com/CodeDistillery/hyperion-device-setup/master/local.json -o local.json`
3. Configure `local.json` file
4. Configure variables in `setup.sh`
5. Configure hostname
   1. `sudo raspi-config`
   2. Select Network Options
   3. Select Hostname
6. `sudo update-alternatives --set iptables /usr/sbin/iptables-legacy`
7. `sudo reboot`
8. `bash setup.sh`
9. `sudo reboot`
10. Login as new user
11. `sudo deluser -remove-home pi`
