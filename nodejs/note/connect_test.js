const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');

const provider = new HDWalletProvider(
        'series ahead tree leisure history bag badge museum spot imitate primary improve', 
        'http://127.0.0.1:9545');

const web3 = new Web3(provider); // infura 를 통한 ropsten network 에 연결.

const deploy = async () => {

    // 1. web3 통해 contract 를 배포.
    // - 계정정보 입력
    const accounts = await web3.eth.getAccounts(); // 비동기함수임.
    console.log(accounts);

    const balance = await web3.eth.getBalance(accounts[0]);
    console.log(balance);

};


deploy();