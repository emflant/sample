
### nvm 설치
https://github.com/creationix/nvm

### nvm upgrade   
https://github.com/creationix/nvm#manual-upgrade

사실 아래 스크립트를 쉘에서 한번에 붙여서 실행하면 된다. 
```sh
(
  cd "$NVM_DIR"
  git fetch --tags origin
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
```  
  
node 최신버전 설치
```sh
> nvm install node
Downloading and installing node v10.11.0...
Downloading https://nodejs.org/dist/v10.11.0/node-v10.11.0-darwin-x64.tar.xz...
######################################################################## 100.0%
Computing checksum with shasum -a 256
Checksums matched!
Now using node v10.11.0 (npm v6.4.1)
```

https://metamask.io/


mkdir sample/nodejs/note #폴더를 만든다.

작업폴더에서 아래 명령어 실행해서 프로젝트 준비를 함.

npm init
npm install --save web3
npm install --save mocha
npm install --save solc
npm install --save ganache-cli


package.json 파일을 수정한다.
scripts.test 부문은 mocha 로 셋팅



next.js [https://nextjs.org/]  
typescript [https://www.typescriptlang.org]


https://codesandbox.io/

