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
  var id = req.params.id;
  var query = 'SELECT * from member';
  if(id){
    query = query + ' where id =' + id;
  }
  invokeRest(query, res);
};

module.exports.fetchAddressData = function (req, res) {
  var id = req.params.id;
  var query = 'SELECT * from address';
  if(id){
    query = query + ' where id =' + id;
  }
  invokeRest(query, res);
};

module.exports.fetchDepositData = function (req, res) {
  var id = req.params.id;
  var query = 'SELECT * from deposit_history';
  if(id){
    query = query + ' where id =' + id;
  }
  invokeRest(query, res);
};

module.exports.fetchLoanData = function (req, res) {
  var id = req.params.id;
  var query = 'SELECT * from loan';
  if(id){
    query = query + ' where id =' + id;
  }
  invokeRest(query, res);
};

module.exports.login = function (req, res) {

};

module.exports.logout = function (req, res) {

};