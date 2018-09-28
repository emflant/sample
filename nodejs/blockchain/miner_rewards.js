const SHA256 = require('crypto-js/sha256');


class Transaction {
    constructor(fromAddress, toAddress, amount) {
        this.fromAddress = fromAddress;
        this.toAddress = toAddress;
        this.amount = amount;
    }
}


class Block {
    constructor(timestamp, transactions, previousHash = '') {
        this.timestamp = timestamp;
        this.transactions = transactions;
        this.previousHash = previousHash;
        this.hash = this.calculateHash();
        this.nonce = 0;
    }

    calculateHash() {
        return SHA256(this.index + this.previousHash
            + this.timestamp + JSON.stringify(this.data) + this.nonce).toString();
    }

    mineBlock(difficulty) {
        while (this.hash.substring(0, difficulty) !== Array(difficulty + 1).join('0')) {
            this.nonce += 1;
            this.hash = this.calculateHash();
        }

        console.log(`Block mined : ${this.hash}`);
    }
}

class Blockchain {
    constructor() {
        this.chain = [Blockchain.createGenesisBlock()];
        this.difficulty = 5;
        this.pendingTransactions = [];
        this.miningReward = 100;
    }

    static createGenesisBlock() {
        return new Block('01/01/2017', [], '0');
    }

    getLastestBlock() {
        return this.chain[this.chain.length - 1];
    }

    minePendingTransactions(miningRewardAddress) {
        const block = new Block(Date.now(), this.pendingTransactions,
            this.getLastestBlock().hash);
        block.mineBlock(this.difficulty);

        console.log('Block successfully mined!');

        this.chain.push(block);

        this.pendingTransactions = [
            new Transaction(null, miningRewardAddress, this.miningReward)
        ];
    }

    createTransaction(transaction) {
        this.pendingTransactions.push(transaction);
    }

    getBalanceOfAddress(address) {
        let balance = 0;

        this.chain.forEach((block) => {
            block.transactions.forEach((trans) => {
                if (trans.fromAddress === address) {
                    balance -= trans.amount;
                }

                if (trans.toAddress === address) {
                    balance += trans.amount;
                }
            });
        });

        return balance;
    }

    isChainValid() {
        console.log(JSON.stringify(this.chain, null, 4));
        for (let i = 1; i < this.chain.length; i++) {
            const currentBlock = this.chain[i];
            const previousBlock = this.chain[i - 1];

            if (currentBlock.hash !== currentBlock.calculateHash()) {
                return false;
            }

            if (currentBlock.previousHash !== previousBlock.hash) {
                return false;
            }
        }
        return true;
    }
}

const testCoin = new Blockchain();

testCoin.createTransaction(new Transaction('address1', 'address2', 100));
testCoin.createTransaction(new Transaction('address2', 'address1', 30));

console.log('Starting the miner...');
testCoin.minePendingTransactions('my-address');

console.log('My Balance is ', testCoin.getBalanceOfAddress('my-address'));

console.log('Starting the miner again...');
testCoin.minePendingTransactions('my-address');
console.log('My Balance is ', testCoin.getBalanceOfAddress('my-address'));

console.log(testCoin.isChainValid());
