##### Set the variables below #####

# Name of this device
hostname=

# Local user
user=

# Local login password, used with reverse ssh tunnel for example
password=

###################################

echo Running setup...

sudo apt update && sudo apt upgrade -y
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y ufw libudev-dev libgphoto2-dev nodejs git
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy

echo "Adding user $user..."
sudo hostname $hostname # Temporary
sudo adduser --disabled-password --gecos "" $user
sudo usermod -a -G adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input,netdev,gpio,i2c,spi $user
echo "$user:$password" | sudo chpasswd
sudo -H -u $user bash -c 'ssh-keygen -t rsa -b 4096 -N "" -C "$USER@$HOSTNAME" -f /home/$USER/.ssh/id_rsa'
sudo -H -u $user bash -c 'cat /home/$USER/.ssh/id_rsa.pub'
read -p "Copy key above and add to Github repo deploy keys and authorized_keys on ssh host. Press enter to continue.."

echo "Cloning repo..."
sudo -H -u $user bash -c 'git clone git@github.com:CodeDistillery/hyperion-device-node.git /home/$USER/app'

echo "Installing project dependencies..."
sudo cp .env /home/$user/app/ && sudo chown $user:$user /home/$user/app/.env
sudo npm install -g pm2
sudo -H -u $user bash -c 'cd /home/$USER/app && npm install'

echo "Starting up the project..."
sudo -H -u $user bash -c 'cd /home/$USER/app && pm2 start && pm2 startup'
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u $user --hp /home/$user
sudo -H -u $user bash -c 'cd /home/$USER/app && pm2 save'
