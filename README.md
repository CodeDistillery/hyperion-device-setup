1. `curl https://raw.githubusercontent.com/CodeDistillery/hyperion-device-setup/master/setup.sh -o setup.sh && chmod +x setup.sh`
2. `curl https://raw.githubusercontent.com/CodeDistillery/hyperion-device-setup/master/.env -o .env`
3. Configure `.env` file
4. Configure variables in `setup.sh`
5. `bash setup.sh`
6. Reboot
7. Login as new user
8. `sudo ufw limit OpenSSH && sudo ufw enable`
9. `sudo deluser -remove-home pi`
