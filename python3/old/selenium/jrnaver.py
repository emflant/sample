'''
동요 검색해서 인기재생하기.
'''
from selenium import webdriver as wd
from selenium.webdriver.support import expected_conditions as EC 
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait

driver = wd.Firefox(executable_path='./lib/geckodriver')
driver.set_window_position(0, 700)
driver.set_window_size(1280, 668)
driver.get('http://www.naver.com')

# al_jr 클래스를 찾음. '"'쥬니버네이버' 링크임.
al_jr = driver.find_element_by_class_name('al_jr')
# print(type(al_jr))
al_jr.click()

# 동요 링크 확인.
WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.LINK_TEXT, '동요')))
driver.find_element_by_link_text('동요').click()

# 인기있어요 전체재생 버튼 클릭
WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, '.thumb_list__menu_btn.type__green._PLAY_ALL')))
driver.find_element_by_css_selector('.thumb_list__menu_btn.type__green._PLAY_ALL').click()


