var Handlebars = require('handlebars');


var template = 'Hello, {{foo}}';
var render = Handlebars.compile(template);

var data = { foo : 'world' };

console.log(render(data));
console.log(render({ foo : 'there'}));