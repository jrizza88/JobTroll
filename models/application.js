'use strict';
module.exports = function(sequelize, DataTypes) {
  var Application = sequelize.define('Application', {
    companyName: DataTypes.STRING,
    position: DataTypes.STRING,
    dateApplied: DataTypes.STRING,
    replied: DataTypes.STRING,
    nextEvent: DataTypes.STRING,
    notes: DataTypes.STRING,
    resume: DataTypes.STRING
 //   image: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        Application.belongsTo(models.User);
        }
    }
  });
  return Application;
};