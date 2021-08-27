let a = [1,2,3];
console.log(a);

let b = Buffer.from(a);
console.log(b);

let buf = Buffer.from('This is my pretty example');
let json = JSON.stringify(buf);

console.log(json);

let buf2 = Buffer.from(JSON.parse(json).data);

console.log(buf2);
console.log(buf2.toString());