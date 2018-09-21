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




