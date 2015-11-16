/**
 * Created by Deepak.Pundir on 11/14/2015.
 */

var db = require('mysql');
var restService = require('./rest-service');

module.exports.fetchData = function (req, res) {
  var entity = req.params.entity;
  var id = req.params.id;
  var fields = {};
  if(id){
    fields.id = parseInt(id, 10);
  }
  restService.fetchData(entity, '*', fields, {id: 'desc'}, res);
};

module.exports.createData = function (req, res) {
  var entity = req.params.entity;
  var data = req.body;
  restService.createData(entity, data, res);
};

module.exports.updateData = function (req, res) {
  var entity = req.params.entity;
  var id = req.params.id;
  var data = req.body;
  var fields = {};
  if(id){
    fields.id = parseInt(id, 10);
  }
  restService.updateData(entity, data, fields, res);
};