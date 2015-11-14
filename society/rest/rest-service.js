/**
 * Created by Deepak.Pundir on 11/14/2015.
 */

var db = require('mysql');
var mysqlUtilities = require('mysql-utilities');

var pool = db.createPool({
  connectionLimit: 5,
  host: 'localhost',
  database: 'society',
  user: 'admin',
  password: 'admin123'
});

module.exports.invokeRest = function (table, fields, where, order, res) {
  pool.getConnection(function(err, connection) {
    mysqlUtilities.upgrade(connection);
    connection.select(table, fields, where, order, function (err, rows, fields) {
      connection.release();
      if (err) throw err;
      res.send(rows);
    });
  });

};

module.exports.login = function (req, res) {

};

module.exports.logout = function (req, res) {

};