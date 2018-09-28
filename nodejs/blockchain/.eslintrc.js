module.exports = {
    "extends": "airbnb-base",
    "rules" : {
        "indent": ["error", 4],
        "no-console" : "off",
        "comma-dangle": ["error", "never"],

        // 파라미터를 직접 수정하는 것을 허용하지 않으나, 특정 메소드는 예외처리함.
        "no-param-reassign": ["error", { "props": true, "ignorePropertyModificationsFor": ["newBlock"] }],
        // for 에서는 ++ 연산 허용
        "no-plusplus" : ["error", { "allowForLoopAfterthoughts": true }] 
    },
    "env": {
        "node": true,
        "mocha": true
    }
};