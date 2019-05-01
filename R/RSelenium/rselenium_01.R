install.packages("RSelenium")
library(RSelenium)
library(ps)
ps()

# java -jar $WORKSPACE/sample/R/RSelenium/selenium-server-standalone-3.9.1.jar
remDr <- remoteDriver(
  remoteServerAddr = "localhost",
  port = 4444L,
  browserName = "chrome"
)
exists("remDr")

(remDr)
remDr
remDr$open()
# remDr$getStatus()

remDr$navigate("http://www.google.com/")
remDr$navigate("http://www.bbc.co.uk")
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


remDr$open()
remDr$navigate("http://www.everland.com/web/everland/main.html")

# //*[@id="btn_reserve"]
webElem = remDr$findElement(using = "id", value = "btn_reserve")
webElem$clickElement()
remDr$getWindowHandles()
# //*[@id="kakao_signin"]/a/img
remDr$getWindowHandles()
remDr$getCurrentWindowHandle()
remDr$switchToWindow(remDr$getWindowHandles()[[2]])
webElem = remDr$findElement(using = "id", value = "kakao_signin")
webElem$clickElement()


# //*[@id="loginEmail"]
remDr$switchToWindow(remDr$getWindowHandles()[[3]])
webElem = remDr$findElement(using = "id", value = "loginEmail")
webElem$sendKeysToElement(list("emflant@naver.com"))

# //*[@id="loginPw"]
webElem = remDr$findElement(using = "id", value = "loginPw")
webElem$sendKeysToElement(list("********", key = "enter"))


# //*[@id="container"]/div[1]/div[1]/a
webElem = remDr$findElement(using = "id", value = "loginPw")

