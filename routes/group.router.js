const Router = require('express');
const router = new Router();

const groupsController = require('../controllers/groups.controller');


router.post('/groups', groupsController.createGroup);
router.get('/groups', groupsController.getGroups);
router.get('/groups/:id', groupsController.getOneGroup);
router.put('/groups', groupsController.updateGroup);
router.delete('/groups/:id', groupsController.deleteGroup);

module.exports = router;
