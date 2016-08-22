
var express = require('express');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
//var myConnection = require('./config/connection');
var exphbs = require('express-handlebars');
//var bcrypt = require('bcrypt-nodejs');
var orm = require('./config/orm');
var passport = require('passport');
var session = require('express-session');
// have to pass on a Store object on to the session
var SequelizeStore = require('connect-session-sequelize')(session.Store);
// using local strategy, and setting it up here to give options.
// may need to customize this //
var LocalStrategy = require('passport-local').Strategy;


var db =require('./models/index.js').sequelize
// this is used to sync the data
db.sync();
var User = require('./models').User;
var app = express();

  app.set('view engine', 'html') // will be handlebars or html
  app.engine('html', exphbs({
    defaultLayout: 'main'
  }));// handlebars or html

passport.use('local', new LocalStrategy(
  function(username, password, done) {
    console.log("i work!")
    User.findOne({where: {username: username}} ).then(function(username){
      if (!user){
        return done(null, false);
      }
      var realPass = user.password;
      if (!user.username){
        return done(null, false);
      }
      return done(null, user);
  })
    .catch(function(err){
      throw err;
    })
  }));
});

// also want to give the option to login via Linkedin
//passport.use(new LinkedInStrategy({
//    consumerKey: LINKEDIN_API_KEY,
//    consumerSecret: LINKEDIN_SECRET_KEY,
//    callbackURL: "http://127.0.0.1:3000/auth/linkedin/callback"
//  },
//  function(token, tokenSecret, profile, done) {
//    User.findOrCreate({ linkedinId: profile.id }, function (err, user) {
//      return done(err, user);
//    });
//  }
//));

passport.serializeUser(function(user, cb){
  console.log("hi there", user.id)
  cb(null, user.id);
});

passpot.deserializeUser(function(id, cb){
  User.findOne( {where: {id: id} }).then(function(user){
    cb(null, user);
  }).catch(function(err) {
      if (err) {
          return cb(err);
      }
    })
})



  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({
    extended: true
  }));
  app.use(cookieParser())
  app.use(session({
    secret: 'keyboard cat',
    store: new SequelizeStore({
      db: db
    }),
    app.use(passport.initialize());
    app.use(passport.session());
  }))
  app.use(bodyParser.text());
  app.use(bodyParser.json({
    type: 'application/vnd.api+json'
  }));
  app.use(methodOverride('_method'));
  app.use(express.static(__dirname + '/public'));

  app.listen(PORT, function () {
  	console.log('Listening on port: ' + PORT);
  });

//ROUTES
app.get('/', function(req,res){
  if(req.user) {
    console.log(req.user)
    res.render('home', {name: req.user.username});
  } else {
    res.redirect('/login');
		}
})

app.get('/login', function(req, res){
  res.render('login');
})

app.post('/login', passport.authenticate('local', {successRedirect: '/', failureRedirect: '/login'}));



var PORT = process.env.PORT || 8000;
