#!/bin/sh

installNode()
{
    if command -v yum >/dev/null 2>&1; then 
        echo 'yum install node' 
    elif command -v apt-get >/dev/null 2>&1; then 
        echo 'apt-get install node'
    else 
        echo 'no exists package manager' 
    fi
}

installGhoti()
{
    echo 'install ghoti'
    #sudo npm install -g ghoti-cli
}


if command -v node >/dev/null 2>&1; then 
    installGhoti
else 
    installNode
fi

