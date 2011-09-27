# Requirements to get Java 'stuff'
sudo apt-get install python-software-properties
sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
sudo apt-get update

# Install required packages
sudo apt-get install curl python-pip python sun-java6-jre sun-java6-plugin sun-java6-fonts imagemagick xvfb
sudo pip install selenium

# Download Selenium server
curl http://selenium.googlecode.com/files/selenium-server-standalone-2.6.0.jar > selenium-server.jar

# Start and setup X virtual frame buffer
Xvfb :42 -ac -screen 0 1000x1200x30 &
export DISPLAY=:42

# getting example python script to run selenium test
curl # TODO add github raw source url here

# Start selenium server and send to background
java -jar selenium-server.jar &

# Run example python script
python test.py

# did it work?
ls screenshot.png && ls source.html
