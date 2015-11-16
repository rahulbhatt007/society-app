var express = require('express');
var router = express.Router();

var societyService = require('../rest/society-service');

/* GET users listing. */
router.get('/get/:entity', societyService.fetchData);
router.get('/get/:entity/:id', societyService.fetchData);
router.post('/post/:entity', societyService.createData);
router.put('/put/:entity', societyService.updateData);
router.put('/put/:entity/:id', societyService.updateData);

module.exports = router;
