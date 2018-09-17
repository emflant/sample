/**
provider 를 각 파일마다 구현하다보니, 공통으로 별도 작성.
*/

const ganache = require('ganache-cli');
const HDWalletProvider = require('truffle-hdwallet-provider');

const localMnemonic = 'series ahead tree leisure history bag badge museum spot imitate primary improve';
const ropstenMnemonic = 'lamp kitten stone manage spell scene stay oxygen sheriff divert ticket fence';

const providers = {

    // ganache_cli 사용시
    ganache_cli: ganache.provider({ mnemonic: localMnemonic }),

    // ganache window 프로그램 버전일때 사용. 포트 확인필요.
    ganache_local: new HDWalletProvider(localMnemonic, 'http://127.0.0.1:9545'),

    // 테스트넷 접속할때, (ropsten 서버)
    ropsten: new HDWalletProvider(ropstenMnemonic, 'https://ropsten.infura.io/v3/35024d84adab4e12b01d10aa6c8e89cd')
};

module.exports = providers;
