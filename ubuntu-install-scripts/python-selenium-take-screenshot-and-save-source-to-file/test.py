from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait # available since 2.4.0

print "starting up firefox"
driver = webdriver.Firefox()

print "loading up webpage"
driver.get("http://michaelgrace.org")

print "saving screenshot of page"
driver.save_screenshot("screenshot.png")

print "getting the page source as interpreted by firefox and saving to file"
source = driver.execute_script('return document.documentElement.innerHTML')
f = open('source.html','w')
f.write(source.encode('utf-8'))
f.close()

print "all done"
driver.quit()