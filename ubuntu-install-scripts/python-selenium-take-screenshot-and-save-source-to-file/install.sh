#!/bin/bash
#######################################
# Selenium Python Install
# Run with sudo
#######################################
SECONDS=0
if [[ "$(/usr/bin/whoami)" != "root" ]]; then 
    echo "This script must be run as root or using sudo. Script aborted."
    exit 1
fi
echo ""
echo ""
echo "===================================================="
echo "Updating apt-get"
echo "===================================================="
echo ""
echo ""
sudo apt-get install --assume-yes --quiet python-software-properties
sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
sudo apt-get update --assume-yes --quiet


echo ""
echo ""
echo "===================================================="
echo "Installing required packages"
echo "===================================================="
echo ""
echo ""
sudo apt-get install --assume-yes --quiet curl python-pip python sun-java6-jre sun-java6-plugin sun-java6-fonts imagemagick xvfb
sudo pip install selenium


echo ""
echo ""
echo "===================================================="
echo "Downloading Selenium server"
echo "===================================================="
echo ""
echo ""
curl http://selenium.googlecode.com/files/selenium-server-standalone-2.6.0.jar > selenium-server.jar


echo ""
echo ""
echo "===================================================="
echo "Starting and setting up X virtual frame buffer"
echo "===================================================="
echo ""
echo ""
Xvfb :42 -ac -screen 0 1000x1200x30 &
export DISPLAY=:42

echo ""
echo ""
echo "===================================================="
echo "getting example python script to run selenium test"
echo "===================================================="
echo ""
echo ""
curl https://raw.github.com/MikeGrace/Code-Junk-Drawer/master/ubuntu-install-scripts/python-selenium-take-screenshot-and-save-source-to-file/test.py > test.py


echo ""
echo ""
echo "===================================================="
echo "Starting selenium server and sending to background"
echo "===================================================="
echo ""
echo ""
java -jar selenium-server.jar &

echo ""
echo ""
echo "===================================================="
echo "Running test selenium script"
echo "===================================================="
echo ""
echo ""
python test.py


echo ""
echo ""
echo "===================================================="
echo "Shutting down Selenium"
echo "===================================================="
echo ""
echo ""
sudo kill `pidof java`


echo ""
echo ""
echo "===================================================="
echo "If it worked the screenshot and source files will"
echo "be listed below."
echo "..................."
ls screenshot.png && ls source.html
echo "..................."
echo ""
echo "And it only took $SECONDS seconds to do it!"
echo "===================================================="
echo ""
echo ""
