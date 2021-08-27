const bcrypt = require('bcrypt');

const myPlaintextPassword = 'my_password';

// From @garthk, on a 2GHz core you can roughly expect:
// rounds=8 : ~40 hashes/sec
// rounds=9 : ~20 hashes/sec
// rounds=10: ~10 hashes/sec
// rounds=11: ~5  hashes/sec
// rounds=12: 2-3 hashes/sec
// rounds=13: ~1 sec/hash
// rounds=14: ~1.5 sec/hash
// rounds=15: ~3 sec/hash
// rounds=25: ~1 hour/hash
// rounds=31: 2-3 days/hash
for (let i = 15; i >= 10; i -= 1) {
    bcrypt.genSalt(i, (err1, salt) => {
        bcrypt.hash(myPlaintextPassword, salt, (err2, hash) => {
            console.log(`${myPlaintextPassword} - ${i} - ${salt} : ${hash}`);
        });
    });
}
