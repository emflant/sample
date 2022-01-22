from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

# https://docs.python.org/3/library/configparser.html
import configparser

# https://docs.python.org/3/library/pathlib.html
from pathlib import Path


def read_shcard(yyyymm):
    config = configparser.ConfigParser()
    config.read(str(Path.home()) + '/data/my-config.ini')

    firefox_options = webdriver.FirefoxOptions()
    driver = webdriver.Remote(command_executor='http://host.docker.internal:4444', options=firefox_options)

    # shcard_202102.html
    driver.get('file://' + config['selenium']['card.path'] + "shcard_" + yyyymm + ".html")
    driver.find_element_by_xpath('//*[@id="password"]').send_keys(config['default']['birth.yymmdd'] + Keys.ENTER)
    driver.implicitly_wait(10)

    driver.find_element_by_xpath('/html/body/div[2]/div[2]/ul/li[2]/a').click()
    # outer_html = driver.find_element_by_xpath('/html/body/div[2]/div[2]/div[3]/table[2]').get_attribute('outerHTML')

    outer_html = driver.page_source

    p = Path(str(Path.home()) + '/data/card/result_html_' + yyyymm + '.html')
    p.write_text(outer_html, encoding='euc-kr')

    driver.quit()


'''
read_shcard('202102')
read_shcard('202103')
read_shcard('202104')
read_shcard('202105')
read_shcard('202106')
read_shcard('202107')
'''
read_shcard('202108')