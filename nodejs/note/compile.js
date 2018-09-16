
const path = require('path');
const fs = require('fs');
const solc = require('solc');


// 1. note.sol 절대경로 불러오기
const notePath = path.resolve(__dirname, 'contracts', 'Note.sol');

console.log(notePath);

// 2. solc 를 통해 compile 처리.
const source = fs.readFileSync(notePath, 'UTF-8');
// console.log(solc.compile(source,1));

const result = solc.compile(source, 1);
// console.log("all : " + JSON.stringify(result));
// const interfaceInfo = result.contracts[':Note'].interface;
// const bytecode = result.contracts[':Note'].bytecode;
// console.log("interface : " + interface);
// console.log("bytecode : " + bytecode);

module.exports = result.contracts[':Note'];
