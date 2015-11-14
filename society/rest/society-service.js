/**
 * Created by Deepak.Pundir on 11/14/2015.
 */

var db = require('mysql');
var restService = require('./rest-service');

/**
 *
 * @param req
 * @param res
 */

module.exports.fetchMemberData = function (req, res) {
  var id = req.params.id;
  var query = '';
  var fields = {};
  if(id){
    fields.id = id;
  }
  restService.invokeRest('member', '*', fields, {id: 'desc'}, res);
};

module.exports.fetchAddressData = function (req, res) {
  var id = req.params.id;
  var query = '';
  var fields = {};
  if(id){
    fields.id = id;
  }
  restService.invokeRest('address', '*', fields, {id: 'desc'}, res);
};

module.exports.fetchDepositData = function (req, res) {
  var id = req.params.id;
  var query = '';
  var fields = {};
  if(id){
    fields.id = id;
  }
  restService.invokeRest('deposit_history', '*', fields, {id: 'desc'}, res);
};

module.exports.fetchLoanData = function (req, res) {
  var id = req.params.id;
  var query = '';
  var fields = {};
  if(id){
    fields.id = id;
  }
  restService.invokeRest('loan', '*', fields, {id: 'desc'}, res);
};