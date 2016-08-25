'use strict';

module.exports = {
  up: function (queryInterface, Sequelize) {
      return queryInterface.bulkInsert('Recruiters', [{
        company: 'jared',
        description: 'me'
      }], {});
  },

  down: function (queryInterface, Sequelize) {
      return queryInterface.bulkDelete('Recruiters', null, {truncate: true});
  }
};