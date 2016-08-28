'use strict';
module.exports = function(sequelize, DataTypes) {
  var User = sequelize.define('User', {
    username: DataTypes.STRING,
    password: DataTypes.STRING,
    email: DataTypes.STRING,
    firstName: DataTypes.STRING,
    lastName: DataTypes.STRING
 //   image: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        User.hasMany(models.application);
        }

    }
  });
  return User;
};
