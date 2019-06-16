library(RSelenium)
library(lubridate)
library(tidyverse)

gmail.connect = function(){
  remDr <- remoteDriver(
    remoteServerAddr = "localhost",
    port = 4444L,
    browserName = "chrome"
  )
  remDr
}

gmail.login = function(remDr, id, pw){
  
  remDr$open()
  remDr$setImplicitWaitTimeout(milliseconds = 10000)
  remDr$navigate("https://mail.google.com")
  
  # type my id.
  webElem = remDr$findElement(using = "id", value = "identifierId")
  webElem$sendKeysToElement(list(id))
  
  # click next button.
  webElem = remDr$findElement(using = "id", value = "identifierNext")
  webElem$clickElement()
  
  # new 
  Sys.sleep(3)
  webElem = remDr$findElement(using = "name", value = "password")
  webElem$sendKeysToElement(list(pw))
  
  webElem = remDr$findElement( using = "xpath", value = "//span[text()='다음']")
  webElem$clickElement()
}




gmail.kakaocardmail = function(remDr, search_text){
  
  webElem = remDr$findElement(using = "xpath", value = "//*[@id='gs_lc50']/input[1]")
  webElem$sendKeysToElement(list(search_text, key = "enter"))
  webElem = remDr$findElement(using = 'xpath', value = '/html/body/div[7]/div[3]/div/div[2]/div[1]/div[2]/div/div/div/div/div[2]/div/div[1]/div/div[2]/div[4]/div[1]/div/table/tbody/tr/td[6]/div[1]/div/div[2]/span/span')
  webElem$clickElement()
  
  webElem = remDr$findElement(using = 'link text', 
                              value = '전체 메일 보기')
  webElem$clickElement()
  
  
  remDr$switchToWindow(remDr$getWindowHandles()[[2]])
  webElem = remDr$findElement(using = 'xpath',
                              value = '/html/body/div/div/table[2]/tbody/tr[3]/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td[3]/a[2]')
  webElem$clickElement()
  
  remDr$closeWindow()
  remDr$switchToWindow(remDr$getWindowHandles()[[1]])
  
  webElem = remDr$findElement(using = 'xpath', value = '//*[@id="gb"]/div[2]/div[1]/div[4]/div/a')
  webElem$clickElement()
}

gmail.downloadfiles = function (){
  
  id = readline("What is your gmail's id? : ")
  pw = readline("What is your gmail's password? : ")
  
  remDr = gmail.connect()
  gmail.login(remDr, id, pw)
  
  a = ymd('20180601') + months(0:11)
  b = str_replace(str_sub(a, 1, 7), '-', '년')
  c = str_c('subject:(이용내역서(', b, '월))')
  c
  for(in_month in c){
    print(in_month)
    gmail.kakaocardmail(remDr, in_month)
  }
  remDr$closeWindow()
  remDr$close()
}

gmail.downloadfiles()
