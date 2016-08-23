'use strict';
module.exports = {
  up: function(queryInterface, Sequelize) {
    return queryInterface.createTable('applications', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      companyName: {
        type: Sequelize.STRING
      },
      position: {
        type: Sequelize.STRING
      },
      dateApplied: {
        type: Sequelize.DATE
      },
      replied: {
        type: Sequelize.STRING
      },
      nextEvent: {
        type: Sequelize.STRING
      },
      notes: {
        type: Sequelize.TEXT
      },
      resume: {
        type: Sequelize.STRING
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: function(queryInterface, Sequelize) {
    return queryInterface.dropTable('applications');
  }
};