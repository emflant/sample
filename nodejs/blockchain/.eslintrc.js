module.exports = {
    "extends": "airbnb-base",
    "rules" : {
        "indent": ["error", 4],
        "no-console" : "off",
        "comma-dangle": ["error", "never"],
        "no-param-reassign": ["error", { "props": true, "ignorePropertyModificationsFor": ["newBlock"] }]
    },
    "env": {
        "node": true,
        "mocha": true
    }
};