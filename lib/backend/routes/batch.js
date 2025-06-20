const express = require('express');
const router = express.Router();
const Batch = require('../models/Batch');
const { body, validationResult } = require('express-validator');

router.get('/', async (req, res, next) => {
  try {
    res.json(await Batch.find());
  } catch (error) {
    next(error);
  }
});

router.post('/',
  [
    body('name').notEmpty().withMessage('Batch name is required').isString().withMessage('Batch name must be a string'),
    body('instructor').optional().isString().withMessage('Instructor name must be a string')
  ],
  async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    try {
      res.json(await Batch.create(req.body));
    } catch (error) {
      next(error);
    }
});

router.put('/:id',
  [
    body('name').optional().isString().withMessage('Batch name must be a string'),
    body('instructor').optional().isString().withMessage('Instructor name must be a string')
  ],
  async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    try {
      const batch = await Batch.findByIdAndUpdate(req.params.id, req.body, { new: true });
      if (!batch) {
        return res.status(404).json({ message: "Batch not found" });
      }
      res.json(batch);
    } catch (error) {
      next(error);
    }
});

router.delete('/:id', async (req, res, next) => {
  try {
    const batch = await Batch.findByIdAndDelete(req.params.id);
    if (!batch) {
      return res.status(404).json({ message: "Batch not found" });
    }
    res.json({ message: "Batch deleted successfully" });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
