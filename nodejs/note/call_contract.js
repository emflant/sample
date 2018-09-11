// 0x3Ef17167E158931b961F86f43c06bCE0FBbb4feA

const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const { bytecode, interface } = require('./compile');

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

    const instance = new web3.eth.Contract(
        JSON.parse(interface),
        '0x5CB6a2826e77156363369aba0b48f3e797CB0D9e'
      );

    await instance.methods.write('test message!!').send({
        from: accounts[0]
      });
    const campaigns =  await instance.methods.showMessage().call();

    console.log(campaigns);
};

deploy();