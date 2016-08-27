'use strict';
module.exports = function(sequelize, DataTypes) {
  var User = sequelize.define('User', {
    UserName: DataTypes.STRING,
    Password: DataTypes.STRING,
    Email: DataTypes.STRING,
    FirstName: DataTypes.STRING,
    LastName: DataTypes.STRING
 //   Image: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
      }
    }
  });
  return User;
};
