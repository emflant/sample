from selenium.webdriver import Firefox
driver = Firefox(executable_path='/Users/imac/sample/lib/geckodriver')



from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

webdriver.Remote(command_executor='http://192.168.25.2:4444/', desired_capabilities=DesiredCapabilities.FIREFOX)



firefox_options = webdriver.FirefoxOptions()

driver = webdriver.Remote(command_executor='http://localhost:4444', options=firefox_options)
driver = webdriver.Remote(command_executor='http://172.19.0.2:4444', options=firefox_options)
driver.get("http://www.google.com")
