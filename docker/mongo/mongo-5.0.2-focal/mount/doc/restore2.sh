# 2025.10.11
mongo mongodb://test22:testpw22@my-mongo:27017/mydb --eval "db.dropDatabase()"
mongorestore --archive=/data/my-data/creart/test.20251011.archive --uri="mongodb://test22:testpw22@my-mongo:27017/mydb" --nsInclude="test.*" --nsFrom="test.*" --nsTo="mydb.*"
