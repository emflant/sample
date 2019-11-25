# mongodb
# install.packages("mongolite")
library(mongolite)

# connecting to: mongodb://localhost:27017/?gssapiServiceName=mongodb

?mongo

m <- mongo("restaurants")
m
dd <- m$find()

cd <- mongo("card_details")
cd

# cd$insert(card_details)
cd$drop()


cd$count('{ "거래종류" : "hana" }') + cd$count('{ "거래종류" : "kakko" }')
cd$count()
cd$find()
