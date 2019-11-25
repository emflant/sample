library(RSelenium)
library(lubridate)
library(tidyverse)
library(rvest)
#java -jar /Volumes/PhotoDisk/30_workspace/sample/R/docs/rselenium/selenium-server-standalone-3.9.1.jar

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

# gmail.downloadfiles()



kakko.readMail = function(remDr, birth, file_name) {
  remDr$navigate(str_c("file://", file_name))
  
  webElem = remDr$findElement(using = "xpath", value = '//*[@id="pwd1"]')
  webElem$sendKeysToElement(list(birth, key = "enter"))
  
  Sys.sleep(1)
  
  trade_list = read_html(remDr$getPageSource()[[1]]) %>% 
    html_nodes(xpath = '//*[@id="mArticle"]/div[3]/table/tbody/tr/td') %>% 
    html_text() %>% 
    str_trim() %>% 
    matrix(ncol = 6, byrow = T) %>% 
    as_tibble(.name_repair = "minimal")
  
  row_name = read_html(remDr$getPageSource()[[1]]) %>% 
    html_nodes(xpath = '//*[@id="mArticle"]/div[3]/table/thead/tr/th') %>% 
    html_text()
  
  colnames(trade_list) = row_name
  trade_list
}
# Warning message:
#   `as_tibble.matrix()` requires a matrix with column names or a `.name_repair` argument. Using compatibility `.name_repair`.
# This warning is displayed once per session. 


kakko.getTradeDetail = function(){
  birth = readline("What is your birth date?(6 digit, ex. 950310) : ")
  
  file_list = list.files(path = "/Users/emflant/Downloads", full.names = T) %>% 
    enframe(name = NULL) %>% 
    filter(str_detect(value , 'KB_.+\\.html'))
  remDr <- remoteDriver(
    remoteServerAddr = "localhost",
    port = 4444L,
    browserName = "chrome"
  )
  remDr$open()
  result = tibble()
  for(f in file_list$value){
    trade_list = kakko.readMail(remDr, birth, f)
    result = bind_rows(result, trade_list)
  }
  remDr$closeWindow()
  remDr$close()
  result
}
result = kakko.getTradeDetail()
result

list.files(path = "/Users/emflant/Downloads", full.names = T) %>% 
  enframe(name = NULL) %>% 
  filter(str_detect(value , 'KB_.+\\.html'))








