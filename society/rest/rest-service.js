/**
 * Created by Deepak.Pundir on 11/14/2015.
 */

var db = require('mysql');
var mysqlUtilities = require('mysql-utilities');
var databaseConfiguration = require('./database-configuration');

var pool = db.createPool(databaseConfiguration);

module.exports.fetchData = function (table, fields, where, order, res) {
  pool.getConnection(function(err, connection) {
    mysqlUtilities.upgrade(connection);
    connection.select(table, fields, where, order, function (err, rows, fields) {
      connection.release();
      if (err) throw err;
      res.send(rows);
    });
  });
};

module.exports.createData = function (table, data, res) {
  pool.getConnection(function(err, connection) {
    mysqlUtilities.upgrade(connection);
    connection.insert(table, data, function (err, recordId) {
      connection.release();
      if (err) throw err;
      res.send(recordId);
    });
  });
};

module.exports.updateData = function (table, data, where, res) {
  pool.getConnection(function(err, connection) {
    mysqlUtilities.upgrade(connection);
    connection.update(table, data, where, function (err, affectedRows) {
      connection.release();
      if (err) throw err;
      res.send(affectedRows);
    });
  });
};

module.exports.login = function (req, res) {

};

module.exports.logout = function (req, res) {

};