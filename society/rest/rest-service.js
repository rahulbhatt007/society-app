/**
 * Created by Deepak.Pundir on 11/14/2015.
 */

var db = require('mysql');
var pool = db.createPool({
  connectionLimit: 5,
  host: 'localhost',
  database: 'society',
  user: 'admin',
  password: 'admin123'
});

var invokeRest = function (query, res) {
  pool.getConnection(function(err, connection) {
    connection.query(query, function (err, rows, fields) {
      connection.release();
      if (err) throw err;
      res.send(rows);
    });
  });

};

/**
 *
 * @param req
 * @param res
 */

module.exports.fetchMemberData = function (req, res) {
  invokeRest('SELECT * from member', res);
};

module.exports.fetchAddressData = function (req, res) {
  invokeRest('SELECT * from address', res);
};

module.exports.login = function (req, res) {
  connection.connect();
};

module.exports.logout = function (req, res) {
  connection.end();
};