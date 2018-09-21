# Code Editor 관련

윈도우에서 개발할때, 여러가지 editor 를 쓰게 되는데

## [Atom](https://atom.io/)

  file > setting > install 선택하여 아래 패키지 설치.(dependency 관련 추가 설치가 있을수도 있음)
- file_icon
- linter-eslint
- linter_solidity


## eslint 사용법
atom 에 설치하는 걸로 끝이 아니고, eslint 설치를 한다.
```sh
npm install --save eslint
```
\
설치후에, eslint 사용할 프로젝트 폴더내에서 init 처리한다.
그후 atom 재실행하면 eslint 결과를 atom 에서 확인 가능함.
```sh
./node_modules/.bin/eslint --init
```
\
물론 콘솔창에서도 결과를 확인 가능함.
```sh
./node_modules/.bin/eslint *.js
```
\
airbnb linter 를 사용했더니, 몇가지 수정이 필요해 rules 를 추가 설정함. 
```javascript
module.exports = {
    "extends": "airbnb-base",
    "rules" : {
        "linebreak-style" : "off", // 윈도우에서 개발하다보니, 제외
        "indent": ["error", 4], // indent 는 스페이스 4자리로 체크하도록
        "no-console" : "off",   // console.log 가 다 warning 으로 떠서 제외토록.
        "comma-dangle": ["error", "never"]  // json, function 등 comma 관련 체크 제외
    },
    "env": {
        "node": true,
        "mocha": true   // mocha 의 테스트코드 작성시, describe, it 등 에러를 막기위한 환경설정
    }
};
```



