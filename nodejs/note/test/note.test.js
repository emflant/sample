const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');


const web3 = new Web3(ganache.provider({ mnemonic: 'lamp kitten stone manage spell scene stay oxygen sheriff divert ticket fence' }));

// 배포코드
// 1. complie 결과중 bytecode, interface 를 get.
// const result = require('../compile');

// 바로 json 키값에 해당하는 네임을 한방에 바인딩.
const { bytecode, interfaceInfo } = require('../compile');

let accounts;
let note;


// describe(), it() 코드들이 실행되지 이전에 실행할 코드
// beforeEach 는 매 it() 코드들이 실행될때마다 전처리 하게 된다.
beforeEach(async () => {
    // (1) 배포할 계정을 생성한다. (account)
    // 이미 가나슈가 만들어논10개 계정중에 하나만 가져오면 됨.(생성 불필요)
    accounts = await web3.eth.getAccounts(); // 동기식으로 await

    // console.log(accounts);

    note = await new web3.eth.Contract(JSON.parse(interfaceInfo))
        .deploy({ data: bytecode, arguments: ['Hello'] })
        .send({ from: accounts[0], gas: '1000000' });

    console.log(`beforeEach contract addresss : ${note.options.address}`);// contract address

    // (2) 해당 계정으로부터 ganache 환경에 contract 배포
});


describe('Note', () => {
    it('deploys a contract', () => {
    // console.log(accounts);
    // console.log(note);
        console.log(note.options.address);// contract address

        // contract 배포된 address 가 있는지 확인. 배포완료여부를 체크하는 의미가 됨.
        assert.ok(note.options.address);
    });

    it('has a default note as "hello"', async () => {
        const result = await note.methods.showMessage().call(); // 데이터를 읽기만 할때, (안읽을때도)
        assert.equal(result, 'Hello');
    });

    // 3. write 라는 함수가 값을 제대로 변화시키는지 확인.
    it('changes a value through write()', async () => {
        const result1 = await note.methods.write('Hi').send({ from: accounts[0] }); // send는 데이터를 쓰는 메소드일때,
        const result2 = await note.methods.showMessage().call(); // 데이터를 읽기만 할때, (안읽을때도)

        console.log(`transactionHash : ${result1.transactionHash}`);
        assert.equal(result2, 'Hi');
    });

    // 3. write 라는 함수가 값을 제대로 변화시키는지 확인.
    it('changes a value through write()', async () => {
        const result2 = await note.methods.showMessage().call(); // 데이터를 읽기만 할때, (안읽을때도)

        console.log(`showMessage : ${result2}`);
        assert.equal(result2, 'Hi');
    });
});
