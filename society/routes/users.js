var express = require('express');
var router = express.Router();

var restService = require('../rest/rest-service');

/* GET users listing. */
router.get('/get/member', restService.fetchMemberData);
router.get('/get/address', restService.fetchAddressData);

module.exports = router;
