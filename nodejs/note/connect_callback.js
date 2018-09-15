const Web3 = require('web3');
const providers = require('./providers');

// ganache window 프로그램 버전일때,
const web3 = new Web3(providers.ganache_cli);


const deploy = () => {

    // 1. web3 통해 contract 를 배포.
    // - 계정정보 입력
    // const accounts = await web3.eth.getAccounts(); // 비동기함수임.
    // console.log(accounts);


    const accounts = web3.eth.getAccounts();
    console.log(accounts);  //Promise { <pending> }  로 리턴됨.

    // web3.eth.getAccounts(callback(error, result){ ... })

    web3.eth.getAccounts(function(error, result){
        console.log(error);
        console.log(result);
    });

    web3.eth.getAccounts((error, result) => {
        if(error == null){
            console.log(result);
        } else {
            console.log(error);
        }

    });

    // const balance = await web3.eth.getBalance(accounts[0]);
    // console.log(balance);

};


deploy();
