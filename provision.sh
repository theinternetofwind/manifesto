#!/bin/bash

echo "Begin provisioning..."
set -e

echo "Installing git and gitflow"
sudo yum -y install git
sudo yum -y install epel-release
sudo yum -y install gitflow


echo "Installing Node and NPM"
function update_nodejs {
  # local VERSION_URL="https://semver.io/node/stable"
  # local LATEST="v$(curl --silent --max-time 5 ${VERSION_URL})"
  # local NODE_URL=https://nodejs.org/dist/${LATEST}/node-${LATEST}-linux-x64.tar.gz
  # curl -L -o tmp.tgz $NODE_URL
  # sudo tar -xvzf tmp.tgz --strip-components=1 -C /usr/local
  # rm tmp.tgz
  # echo "Node.js updated to $(node --version) with npm $(npm --version)."

  sudo curl --silent --location https://rpm.nodesource.com/setup_5.x | bash -
  sudo yum install -y nodejs
}

update_nodejs

# mkdir ~/.npm-global
# npm config set prefix '~/.npm-global'
# sudo echo 'export PATH=~/.npm-global/bin:$PATH' >> /home/vagrant/.bashrc
# source /home/vagrant/.bashrc
# NPM_CONFIG_PREFIX=~/.npm-global /usr/bin/npm install npm@latest -g
npm install npm@latest -g

# echo "Installing grunt"
## NPM_CONFIG_PREFIX=~/.npm-global /usr/bin/npm install -g grunt-cli
# npm install -g grunt-cli

echo "Installing packages"
cd /vagrant
# sudo /usr/bin/npm install
npm install
npm rebuild node-sass
npm install http-server -g
echo "cd /vagrant" >> /home/vagrant/.bashrc
