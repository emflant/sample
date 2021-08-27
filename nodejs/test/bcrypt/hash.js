// node.bcrypt.js/bcrypt.js 파일로 파라미터 확인.
const bcrypt = require('bcrypt');

const saltRounds = 13;
const myPlaintextPassword = 'my_password';

bcrypt.genSalt(saltRounds, (err1, salt) => {
    bcrypt.hash(myPlaintextPassword, salt, (err2, hash) => {
        console.log(`${myPlaintextPassword} - ${salt} : ${hash}`);
    });
});

// not_bacon - 1 - $2b$04$28QouR9OtKoZ99ZMrV48re :
// $2b$04$28QouR9OtKoZ99ZMrV48reDRN3fXrKhwVn/Szf/8Ojs7BSRp.bMty
// not_bacon - 2 - $2b$04$D7q7vcKn6ywQwcrs7wN.3u :
// $2b$04$D7q7vcKn6ywQwcrs7wN.3upl8vsKOnP2oiqNHnkyjZ8ZTQPZtd8DW
// not_bacon - 4 - $2b$04$GAo9tWbzphAWDLViFCF2Pu :
// $2b$04$GAo9tWbzphAWDLViFCF2PuA.QfDV0OSgEIdHtAaq9OhL.O9PXTU0q
// not_bacon - 3 - $2b$04$Evp7rRuKPHWcGjsw07Z5QO :
// $2b$04$Evp7rRuKPHWcGjsw07Z5QOjRpUoXZMwC/a5RmbSRNkZixEO6Tq6Ie
// not_bacon - 5 - $2b$05$z.qakd5mMmk/iyccPa.2pO :
// $2b$05$z.qakd5mMmk/iyccPa.2pO9rYpIJac8NcNgz2FG8ayUqRddFp03GW
// not_bacon - 6 - $2b$06$qKSjfWc5ieRR2f88Cuzvq. :
// $2b$06$qKSjfWc5ieRR2f88Cuzvq.fPfveEZURu8KBBFZrfULbN.8hibCxJK
// not_bacon - 7 - $2b$07$lfHvArbJJ2oNd57lA01o8e :
// $2b$07$lfHvArbJJ2oNd57lA01o8eyNVp/bnOupWS5k6gjsfYc/aDrJFpUsG
// not_bacon - 8 - $2b$08$UUxXGB/qhqTJXUnjcb/O4e :
// $2b$08$UUxXGB/qhqTJXUnjcb/O4eLZLqz61.5wtdFbx.ppZz.gZTndLymc6
// not_bacon - 9 - $2b$09$roDu69cYrTZwfbOQ2/46Be :
// $2b$09$roDu69cYrTZwfbOQ2/46BezL9Q3q/TuWXyfs7Zl7mJe1s3IE6uKgW
// not_bacon - 10 - $2b$10$wKko.bYT5TDtd.TpX/QTIe :
// $2b$10$wKko.bYT5TDtd.TpX/QTIen2XlQmz30J1VRKLEw0n2.fIKYaiEeba
