const express = require('express');
const router = express.Router();
const Course = require('../models/Course');

router.get('/', async (req, res) => res.json(await Course.find()));
router.post('/', async (req, res) => res.json(await Course.create(req.body)));
router.put('/:id', async (req, res) => res.json(await Course.findByIdAndUpdate(req.params.id, req.body)));
router.delete('/:id', async (req, res) => res.json(await Course.findByIdAndDelete(req.params.id)));

module.exports = router;
