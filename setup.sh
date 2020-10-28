##### Set the variables below #####

# Local user
user=

# Local login password, used with reverse ssh tunnel for example
password=

###################################

echo Running setup...

sudo apt update && sudo apt upgrade -y
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y libudev-dev libgphoto2-dev ufw git nodejs
sudo ufw limit OpenSSH && sudo ufw enable

echo "Adding user $user..."
sudo adduser --disabled-password --gecos "" $user
sudo usermod -a -G adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input,netdev,gpio,i2c,spi $user
echo "$user:$password" | sudo chpasswd
sudo -H -u $user bash -c 'ssh-keygen -t rsa -b 4096 -N "" -C "$USER@$HOSTNAME" -f /home/$USER/.ssh/id_rsa'
sudo -H -u $user bash -c 'cat /home/$USER/.ssh/id_rsa.pub'
read -p "Copy key above and add to Github repo deploy keys and authorized_keys on ssh host. Press enter to continue.."

echo "Cloning repo..."
sudo -H -u $user bash -c 'git clone git@github.com:CodeDistillery/hyperion-device-node.git /home/$USER/app'

echo "Installing project dependencies..."
sudo cp local.json /home/$user/app/config/ && sudo chown $user:$user /home/$user/app/config/local.json
sudo npm install -g pm2
sudo -H -u $user bash -c 'cd /home/$USER/app && npm install'

echo "Installing periodic code updates..."
echo "*/1 * * * * $user /bin/bash -c 'cd /home/$user/app && /usr/bin/git pull -q origin master'" | sudo tee -a /etc/cron.d/hyperion

echo "Starting up the project..."
sudo -H -u $user bash -c 'cd /home/$USER/app && pm2 start ecosystem.config.js && pm2 startup'
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u $user --hp /home/$user
sudo -H -u $user bash -c 'cd /home/$USER/app && pm2 save'

echo "Cleaning up..."
rm setup.sh && rm local.json
