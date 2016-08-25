
var express = require('express');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
//var myConnection = require('./config/connection');
var exphbs = require('express-handlebars');
var bcrypt = require('bcrypt-nodejs');
//var orm = require('./config/orm');
var passport = require('passport');
var session = require('express-session');
// have to pass on a Store object on to the session
var SequelizeStore = require('connect-session-sequelize')(session.Store);
// using local strategy, and setting it up here to give options.
// may need to customize this //
var LocalStrategy = require('passport-local').Strategy;
var importData = require('./config/orm.js')['exportData'];


var db = require('./models/index.js').sequelize
// this is used to sync the data
db.sync();
var User = require('./models').User;
var app = express();


app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

passport.use('local', new LocalStrategy(
  function(username, password, done) {
    console.log("I work!")
    User.findOne({where: {username: username} } ).then(function(user){
      if (!user){
        return done(null, false);
      }
           if (!user.username) {
             return done(null, false);
           }

           bcrypt.compare(password, user.password, function(err, result) {
             if (result) {
               return done(null, false);
             }
           })

           return done(null, user);
         })
         .catch(function(err) {
           throw err;
         })
       }
     ));

     passport.serializeUser(function(user, cb) {
       console.log("hi there",user.id)
       cb(null, user.id);
     });

     passport.deserializeUser(function(id, cb) {
       User.findOne( {where: {id: id} }).then(function(user) {
         cb(null, user);
       }).catch(function(err) {
         if (err) {
           return cb(err);
         }
       });
     });

     app.use(bodyParser.urlencoded({ extended: true }))
     app.use(bodyParser.json())
     app.use(cookieParser())
     app.use(session({
       secret: 'jobtroll is the ticket to success',
       store: new SequelizeStore({
         db: db
       }),
       resave: false,
       saveUninitialized: true
     }));
     app.use(passport.initialize());
     app.use(passport.session());

     app.use('/static', express.static('public/assets'));

     // ------------------------------------
     // ROUTES
     // ------------------------------------

     app.get('/', function(req, res) {
       if (req.user) {
         res.render('home', { name: req.user.username});
       } else {
         res.redirect('/login');
       }
     })

     app.get('/login', function(req, res) {
       res.render('login');
     })

     app.post('/login', passport.authenticate('local', { successRedirect: '/', failureRedirect: '/login'}));

      app.get('/research', function(req,res){
        importData.selectAll(function(success){
        res.render('research',{data: success})
        })
      });

     //app.listen(8000)
var PORT = process.env.PORT || 8000;

     app.listen(PORT, function () {
     	console.log('database operation on port: ' + PORT);
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
