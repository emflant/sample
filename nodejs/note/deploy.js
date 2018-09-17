const Web3 = require('web3');
const providers = require('./providers');
const { bytecode, interfaceInfo } = require('./compile');

const web3 = new Web3(providers.ganache_local); // infura 를 통한 ropsten network 에 연결.

const deploy = async () => {
    // 1. web3 통해 contract 를 배포.
    // - 계정정보 입력
    const accounts = await web3.eth.getAccounts(); // 비동기함수임.
    console.log(accounts);

    const balance = await web3.eth.getBalance(accounts[0]);
    console.log(balance);

    // console.log(bytecode);

    // - new web3.eth.Contract().deploy().send()
    const note = await new web3.eth.Contract(JSON.parse(interfaceInfo))
        .deploy({ data: `0x${bytecode}`, arguments: ['Note'] }) // web3 버전마다 달라서, 0x 는 넣어주는게 좋다.
        .send({ from: accounts[0], gas: '3000000', gasPrice: web3.utils.toWei('2', 'gwei') });
    // console.log(note);
    console.log(`options.address : ${note.options.address}`);
};

// 0x5CB6a2826e77156363369aba0b48f3e797CB0D9e
deploy();
