from selenium import webdriver
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import TimeoutException

import os

class GoogleMail:
    
    # def __init__(self):

    def connect_gmail(self):
        self.driver = webdriver.Chrome(executable_path='./lib/chromedriver')
        self.driver.set_window_position(1280, 668)
        self.driver.set_window_size(1280, 668)
        self.driver.get('https://mail.google.com')
        
    def input_id(self, my_id=os.environ['GOOGLE_ID']):
        self.wait_presence_of_element_located((By.ID, 'identifierId')).send_keys(my_id)
        
    def next_id(self):
        self.wait_presence_of_element_located((By.ID, 'identifierNext')).click()
        
    def input_pw(self, my_password=os.environ['GOOGLE_PW']):
        self.wait_presence_of_element_located((By.NAME, 'password')).send_keys(my_password)
        
    def next_pw(self):
        self.wait_element_to_be_clickable((By.XPATH, "//span[text()='다음']")).click()
    
    def input_search_text(self, search_text):
        input_text = self.wait_presence_of_element_located((By.XPATH, '//*[@id="aso_search_form_anchor"]/div/input'))
        input_text.send_keys(search_text, Keys.ENTER)
        
    def click_mail_list(self):
        try:
            mail_list = self.wait_presence_of_element_located((By.XPATH, '/html/body/div[7]/div[3]/div/div[2]/div[1]/div[2]/div/div/div/div/div[2]/div/div[1]/div/div[2]/div[4]/div[1]/div/table/tbody/tr/td[6]/div[1]/div/div[2]/span/span'),3)
            mail_list.click()
            return True
        except TimeoutException:
            print('can\'t find', search_text)
            return False
        
    def click_view_mail(self):
        self.wait_presence_of_element_located((By.XPATH, '//a[text() = "전체 메일 보기"]')).click()

    def download_file(self):
        self.driver.switch_to.window(self.driver.window_handles[1])
        self.wait_presence_of_element_located((By.XPATH, '//a[contains(text(), "다운로드")]')).click()
        self.driver.execute_script("window.close()") 
        self.driver.switch_to.window(self.driver.window_handles[0])
        
    def click_gmail_home(self):
        gmail_home = self.wait_presence_of_element_located((By.XPATH, '//a[@href="#inbox"][@title="Gmail"]/img[1]'))
        gmail_home.click()
        
    def wait_presence_of_element_located(self, expected_conditions, wait_time=10):
        element = WebDriverWait(self.driver, wait_time).until(EC.presence_of_element_located(expected_conditions))
        return element
    
    def wait_element_to_be_clickable(self, expected_conditions, wait_time=10):
        element = WebDriverWait(self.driver, wait_time).until(EC.element_to_be_clickable(expected_conditions))
        return element
    
    