const express = require('express');
const router = express.Router();
const Batch = require('../models/Batch');

router.get('/', async (req, res) => res.json(await Batch.find()));
router.post('/', async (req, res) => res.json(await Batch.create(req.body)));
router.put('/:id', async (req, res) => res.json(await Batch.findByIdAndUpdate(req.params.id, req.body)));
router.delete('/:id', async (req, res) => res.json(await Batch.findByIdAndDelete(req.params.id)));

module.exports = router;
