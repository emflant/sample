const bcrypt = require('bcrypt');
// const saltRounds = 1;
const myPlaintextPassword = 'my_password';
const someOtherPlainTextPassword = 'not_bacon';

// 중간의 $10$, 11, 12... 는 salt rounds 크기임.
const myPasswordHash = [
    '$2b$10$S1q3ehTcr1fmpkcEPIgJP.LcKgc6ngpt.21Iuk6qstlmB1yeD0a0.',
    '$2b$11$igwKjwAxHN4DgAXtf5GJFuldvIvxD0JmBpDiHiWxPbOxxIGqbU1U.',
    '$2b$12$lsoV69RkqfmiVjxfr9JUJOitYuVKRi7tyC5sYtObQlqBWp2rO42ey',
    '$2b$13$z9l22ckiQbI78HbN4ezCReItKyP1Iy9lNOSu4ZZdOU8sTk4PP2mV6',
    '$2b$14$45W43nhV6iOxPs1pB60aDenwTKRKNQkND43PdvHlqf91KmiufZwoi',
    '$2b$15$M9Qsgrjq.WdnMhVwbxHZnujLr7U7subiS/j3B.8dQ68hb84oX66z.'
];

bcrypt.compare(myPlaintextPassword,
    myPasswordHash[5], // saltRounds 크기가 클수록 compare 시간도 그만큼 늘어난다.
    (err, res) => {
        console.log(`${myPlaintextPassword} : ${res}`);
    });

bcrypt.compare(someOtherPlainTextPassword,
    myPasswordHash[1],
    (err, res) => {
        console.log(`${someOtherPlainTextPassword} : ${res}`);
    });
