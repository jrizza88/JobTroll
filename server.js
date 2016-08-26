var express = require('express');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
//var myConnection = require('./config/connection');
var exphbs = require('express-handlebars');
var bcrypt = require('bcrypt-nodejs');
var passport = require('passport');
var session = require('express-session');
// have to pass on a Store object on to the session
var SequelizeStore = require('connect-session-sequelize')(session.Store);
// using local strategy, and setting it up here to give options.

var LocalStrategy = require('passport-local').Strategy;
var importData = require('./config/orm.js')['exportData'];

var db = require('./models/index.js').sequelize;
// this is used to sync the data
db.sync();

var User = require('./models').User;
var app = express();

var companies = require('./models').Companies;

app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

module.exports = passport.use('local', new LocalStrategy(
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

     app.get('/register', function(req, res) {
     	res.render('register'); // uses register.handlebars
     });

     //Register user
     app.post('/register',function(req,res){
       var fname=req.body.fname;
       var lname=req.body.lname;
       var email=req.body.email;
       var username=req.body.username;
       var password=req.body.password;
       var password2=req.body.password2;

       //validation
       req.checkBody('fname','First Name is required').notEmpty();
       req.checkBody('lname','Last Name is required').notEmpty();
       req.checkBody('username','Username is required').notEmpty();
       req.checkBody('email','Email is required').notEmpty();
       req.checkBody('email','Email is not valid').isEmail();
       req.checkBody('password','Password is required').notEmpty();
       req.checkBody('password', 'Password should be 7 to 20 characters').len(7, 20);
       req.checkBody('password2','PasswordS do not match').equals(req.body.password);

       var errors=req.validationErrors();


     var createUser = function(newUser, callback){
       bcrypt.genSalt(10,function(err, salt){
         bcrypt.hash(newUser.password, salt, function(err, hash){
           newUser.password = hash;
           newUser.save(callback);
         });
       });
     }
     var getUserByUsername = function(username, callback){
       var query = {username: username};
       User.findOne(query, callback);
     }
     var getUserById = function(id, callback){
       User.findById(id, callback);
     }
     var comparePassword = function(password, passwd, done, user){
       bcrypt.compare(password, passwd, function(err, isMatch){
         if(err) throw err;
         if(isMatch){
           return done(null, user)
         } else {
           return done(null, false)
         }
       });
     }

     if (errors){
       console.log('You have errors');
     res.render('register',{
       errors:errors
     });
     }
     else {
       console.log('You have no register errors');
       var newUser = new User({
         fname: fname,
         lname: lname,
         username: username,
         email: email,
         password:password
       });
       User.createUser(newUser,function(err, user){
         if (err) throw err;
         console.log(user);
       });
       console.log('success_msg', 'you are registered and now can login');
     res.redirect('/users/login');
     }
     });

     app.post('/login', passport.authenticate('local', { successRedirect: '/', failureRedirect: '/login'}));

      app.get('/research', function(req,res){
        importData.selectAll(function(success){
          console.log(success);
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
//    consumerKey: 77d7l76s8dsyh4,
//    consumerSecret: CkQizFeB4onJWAAH,
//    callbackURL: "http://127.0.0.1:3000/auth/linkedin/callback"
//  },
//  function(token, tokenSecret, profile, done) {
//    User.findOrCreate({ linkedinId: profile.id }, function (err, user) {
//      return done(err, user);
//    });
//  }
//));
