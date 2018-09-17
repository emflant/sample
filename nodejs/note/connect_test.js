const Web3 = require('web3');
const providers = require('./providers');

// const provider = new HDWalletProvider(
//         'series ahead tree leisure history bag badge museum spot imitate primary improve',
//         'http://127.0.0.1:9545');

const web3 = new Web3(providers.ganache_cli); // infura 를 통한 ropsten network 에 연결.

const deploy = async () => {
    // 1. web3 통해 contract 를 배포.
    // - 계정정보 입력
    const accounts = await web3.eth.getAccounts(); // 비동기함수임.
    console.log(accounts);

    const balance = await web3.eth.getBalance(accounts[0]);
    console.log(balance);
};


deploy();
