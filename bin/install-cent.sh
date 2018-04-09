#!/bin/sh

# Script to install the NodeSource Node.js 9.x and
# Ghoti-cli by npm
#
# Run as root or insert `sudo` before `sh`:
#
# curl -sSL https://raw.githubusercontent.com/WMXPY/Ghoti-CLI/master/bin/install.sh | sudo sh -
#   or
# wget -qO- https://raw.githubusercontent.com/WMXPY/Ghoti-CLI/master/bin/install.sh | sudo sh -
#

# Call function when failed
# Print url of github issue, exit program
fail()
{
    echo '> Go to https://github.com/WMXPY/Ghoti-CLI/issues for more information'

    # Exit program
    exit 0
}

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
    else 
        echo '> ! No exists package manager'
        echo '> Maybe you should use other script :?'
        fail
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
        echo '> Ghoti-cli Installed'
    else 
        echo '> Ghoti-cli Install Failed'
        fail
    fi
}

# Install git
installGit()
{
    if command -v git >/dev/null 2>&1; then
        echo '> Git is already installed'
    else
        echo '> Installing git'
        apt-get install git
        sudo apt-get install python-software-properties
        sudo apt-get install software-properties-common 

        # double check git is installed
        if command -v git >/dev/null 2>&1; then
            echo '> Git Installed'
        else
            echo '> Git Install Failed'
            fail
        fi
    fi
}

# Determine if nodeJS and npm enviorment is exist
# Install ghoti-cli by npm after install or determine
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
