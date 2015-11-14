var express = require('express');
var router = express.Router();

var societyService = require('../rest/society-service');

/* GET users listing. */
router.get('/get/member', societyService.fetchMemberData);
router.get('/get/member/:id', societyService.fetchMemberData);
router.get('/get/address', societyService.fetchAddressData);
router.get('/get/address/:id', societyService.fetchAddressData)
router.get('/get/loan', societyService.fetchLoanData);
router.get('/get/loan/:id', societyService.fetchLoanData);
router.get('/get/deposit/history', societyService.fetchDepositData);
router.get('/get/deposit/history/:id', societyService.fetchDepositData);

module.exports = router;
