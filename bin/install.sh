#!/bin/sh

# Script to install the NodeSource Node.js 9.x and
# Ghoti-cli by npm
#
# Run as root or insert `sudo` before `sh`:
#
# curl -sSL https://raw.githubusercontent.com/WMXPY/Ghoti-CLI/master/bin/install.sh | sh -
#   or
# wget -qO- https://raw.githubusercontent.com/WMXPY/Ghoti-CLI/master/bin/install.sh | sh -
#

# Install NodeJS
# Determin which os package manager is available, if any of them is available, install node withit
installNode()
{
    if command -v yum >/dev/null 2>&1; then
        echo '> Installing Node with yum'

        # Fetch source script
        curl --silent --location https://rpm.nodesource.com/setup_9.x | sudo bash -

        # Install nodeJS
        sudo yum -y install nodejs

        # Install install build tools
        echo '> Installing build tools with yum'

        sudo yum install gcc-c++ make
    elif command -v apt-get >/dev/null 2>&1; then
        echo '> Installing Node with apt-get'

        # Fetch source script
        curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

        # Install nodeJS
        sudo apt-get install -y nodejs

        # Install install build tools
        echo '> Installing build tools with apt-get'

        sudo apt-get install -y build-essential
    elif command -v pacman >/dev/null 2>&1; then
        echo '> Installing Node with pacman'

        # Install nodeJS
        pacman -S nodejs npm

    elif command -v pkg >/dev/null 2>&1; then

        # Install nodeJS
        echo '> Installing Node with pkg'

        pkg install nodejs-current
    else 
        echo '> ! No exists package manager'
        exit 0
    fi
}

# Install GHoti-cli
# With npm
installGhoti()
{
    echo '> Installing Ghoti-Cli with npm'

    # Install ghoti-cli
    sudo npm install -g ghoti-cli

    if command -v ghoti >/dev/null 2>&1; then
        echo '> Installed'
    else 
        echo '> Failed' 
    fi
}


if command -v node >/dev/null 2>&1; then

    # if node is exist, try if npm is exist
    if command -v npm >/dev/null 2>&1; then

        # if npm exist, install ghoti-cli
        installGhoti
    else 

        # if npm in not exist, node js is not installed successfully
        installNode
        
        installGhoti
    fi
else 
    installNode
    installGhoti
fi
echo '> Completed'
