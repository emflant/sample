var express = require('express');
var exphbs = require('express-handlebars');

var app = express();

app.engine('handlebars', exphbs());
app.set('view engine', 'handlebars');

app.get('/', function(req, res){
    res.render('home');
});

console.log('http://localhost:3000');
app.listen(3000);


