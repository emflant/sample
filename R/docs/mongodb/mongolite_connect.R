library(mongolite)


con = mongo("restaurants", 
            db = "test", 
            url = "mongodb://localhost:27017")
con$count()


con$find()
