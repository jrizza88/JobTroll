
var express = require('express');
var methodOverride = require('method-override');
var bodyParser = require('body-parser');
var myConnection = require('./config/connection');
var exphbs = require('express-handlebars');
var orm = require('./config/orm');

var app = express();

var PORT = process.env.PORT || 8000;

  app.set('view engine', 'html') // will be handlebars or html
  app.engine('html', exphbs{
    defaultLayout: 'main'
  });// handlebars or html
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({
    extended: false
  }));
  app.use(bodyParser.text());
  app.use(bodyParser.json({
    type: 'application/vnd.api+json'
  }));
  app.use(methodOverride('_method'));
  app.use(express.static(__dirname + '/public'));

  app.listen(PORT, function () {
  	console.log('Listening on port: ' + PORT);
  });
