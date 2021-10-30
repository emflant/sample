### npx 로 app-01 앱을 생성한다.
    $ npx express-generator --view=pug app-01

   create : app-01/
   create : app-01/public/
   create : app-01/public/javascripts/
   create : app-01/public/images/
   create : app-01/public/stylesheets/
   create : app-01/public/stylesheets/style.css
   create : app-01/routes/
   create : app-01/routes/index.js
   create : app-01/routes/users.js
   create : app-01/views/
   create : app-01/views/error.pug
   create : app-01/views/index.pug
   create : app-01/views/layout.pug
   create : app-01/app.js
   create : app-01/package.json
   create : app-01/bin/
   create : app-01/bin/www

### 하위에 app-01이란 폴더가 생겼을거고, cd 접근한다.
change directory:
```
cd app-01
```

### 관련 패키지를 한번에 설치
install dependencies:
```
npm install
```

### 앱을 실행하는 명령어.
run the app:
```
DEBUG=app-01:* npm start
```
