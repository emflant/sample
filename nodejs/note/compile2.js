const path = require('path');//
const fs = require('fs-extra');
const solc = require('solc');


const buildPath = path.resolve(__dirname, 'build');
fs.removeSync(buildPath);

const campaignPath = path.resolve(__dirname, 'contracts', 'Note.sol');
const source = fs.readFileSync(campaignPath, 'utf-8');

const output = solc.compile(source, 1).contracts;
fs.ensureDirSync(buildPath);


// for 문사용하면 key 값만 나오게 됨.
// [return]
// :Campaign
// :CampaignFactory
// for(let contract in output){
//     console.log(contract);
// }

for (const key in output) {
    if(Object.prototype.hasOwnProperty.call(output, key)) {
        console.error(key);
    }

}

for (const contractKey in output) {
  if (Object.prototype.hasOwnProperty.call(output, contractKey)) {
    fs.outputJsonSync(
      path.resolve(buildPath, `${contractKey.replace(':', '')}.json`), // 1번째 인자 : 파일생성할 경로 + 파일명
      output[contractKey], // 2번째 인자 : contract 별 파일내용.
    );
  }
}
