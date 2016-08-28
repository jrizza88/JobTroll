'use strict';
module.exports = function(sequelize, DataTypes) {
  var application = sequelize.define('application', {
    companyName: DataTypes.STRING,
    position: DataTypes.STRING,
    dateApplied: DataTypes.DATE,
    replied: DataTypes.STRING,
    nextEvent: DataTypes.STRING,
    notes: DataTypes.TEXT,
    resume: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
        application.belongsTo(models.User)
      }
    }
  });
  return application;
};