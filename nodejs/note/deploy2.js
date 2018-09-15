
const providers = require('./providers');
const Web3 = require('web3');

const compliedContract = require('./build/Note.json');

// const provider = new HDWalletProvider(
//     'lamp kitten stone manage spell scene stay oxygen sheriff divert ticket fence',
//     'https://ropsten.infura.io/v3/35024d84adab4e12b01d10aa6c8e89cd');

// const provider = new HDWalletProvider(
//     'series ahead tree leisure history bag badge museum spot imitate primary improve',
//     'http://127.0.0.1:9545');

const web3 = new Web3(providers.ganache_local);

const deploy = async () => {
    const accounts = await web3.eth.getAccounts();
    console.log('account[0] address : ' + accounts[0]);

    const result = await new web3.eth.Contract(JSON.parse(compliedContract.interface)).
        deploy({ data : '0x' + compliedContract.bytecode}).
        send({ gas : '1000000', from : accounts[0]});

    console.log('contract address : ' + result.options.address);

};


deploy();
