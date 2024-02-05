# 2024.02.04 이제는 아이맥에서 따로 archive 를 받기 때문에 아래 명령어는 실행할 필요없음.
mongo mongodb://test22:testpw22@my-mongo:27017/mydb --eval "db.dropDatabase()"
mongorestore --archive=/data/my-data/creart/test.20240204.archive --uri="mongodb://test22:testpw22@my-mongo:27017/mydb" --nsInclude="test.*" --nsFrom="test.*" --nsTo="mydb.*"
