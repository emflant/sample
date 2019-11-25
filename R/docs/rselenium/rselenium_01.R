library(RSelenium)
library(ps)
library(tidyverse)
library(rvest)

ps()


# java -jar $WORKSPACE/sample/R/docs/RSelenium/selenium-server-standalone-3.9.1.jar
remDr <- remoteDriver(
  remoteServerAddr = "localhost",
  port = 4444L,
  browserName = "chrome"
)
exists("remDr")

remDr
remDr$open()
# remDr$getStatus()

remDr$navigate("https://mail.google.com")

remDr$goBack()
remDr$getCurrentUrl()

remDr$goForward()
remDr$getCurrentUrl()

remDr$refresh()


remDr$navigate("http://www.google.com/ncr")
webElem <- remDr$findElement(using = "name", value = "q")
webElem$getElementAttribute("name")
webElem$getElementAttribute("class")
webElem$getElementAttribute("id")
webElem$highlightElement()

webElem$sendKeysToElement(list("R cran", key = "enter"))


aa = function(){
  
  if(!exists("remDr")){
    remDr <- remoteDriver(
      remoteServerAddr = "localhost",
      port = 4444L,
      browserName = "chrome"
    )
  }
  remDr$open()
  remDr$navigate("http://www.everland.com/web/everland/main.html")
  webElem = remDr$findElement(using = "name", value = "q")
  webElem$sendKeysToElement(list("R cran", key = "enter"))
}

aa()



remDr <- remoteDriver(
  remoteServerAddr = "localhost",
  port = 4444L,
  browserName = "chrome"
)
remDr$open()
remDr$navigate("file:///Users/emflant/Downloads/KB_20190405.html")

webElem = remDr$findElement(using = "xpath", value = '//*[@id="pwd1"]')
webElem$sendKeysToElement(list("810520", key = "enter"))

Sys.sleep(1)

trade_list = read_html(remDr$getPageSource()[[1]]) %>% 
  html_nodes(xpath = '//*[@id="mArticle"]/div[3]/table/tbody/tr/td') %>% 
  html_text() %>% 
  str_trim() %>% 
  matrix(ncol = 6, byrow = T) %>% 
  as_tibble()

row_name = read_html(remDr$getPageSource()[[1]]) %>% 
  html_nodes(xpath = '//*[@id="mArticle"]/div[3]/table/thead/tr/th') %>% 
  html_text()

colnames(trade_list) = row_name






