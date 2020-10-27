1. `curl https://raw.githubusercontent.com/CodeDistillery/hyperion-device-setup/master/setup.sh -o setup.sh && chmod +x setup.sh`
2. `curl https://raw.githubusercontent.com/CodeDistillery/hyperion-device-setup/master/.env -o .env`
3. Configure `.env` file
4. Configure variables in `setup.sh`
5. Configure hostname to equal whatever you put in `setup.sh`
   1. `sudo raspi-config`
   2. Select Network Options
   3. Select Hostname
6. `bash setup.sh`
7. Reboot
8. Login as new user
9. `sudo ufw limit OpenSSH && sudo ufw enable`
10. `sudo deluser -remove-home pi`
