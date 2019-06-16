library(RSelenium)
library(ps)
library(tidyverse)

ps()


# java -jar $WORKSPACE/sample/R/RSelenium/selenium-server-standalone-3.9.1.jar
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



