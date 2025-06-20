const express = require('express');
const router = express.Router();
const Course = require('../models/Course');
const { body, validationResult } = require('express-validator');

router.get('/', async (req, res, next) => {
  try {
    res.json(await Course.find());
  } catch (error) {
    next(error);
  }
});

router.post('/',
  [
    body('title').notEmpty().withMessage('Course title is required').isString().withMessage('Course title must be a string'),
    body('credits').notEmpty().withMessage('Credits are required').isNumeric().withMessage('Credits must be a number')
  ],
  async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    try {
      res.json(await Course.create(req.body));
    } catch (error) {
      next(error);
    }
});

router.put('/:id',
  [
    body('title').optional().isString().withMessage('Course title must be a string'),
    body('credits').optional().isNumeric().withMessage('Credits must be a number')
  ],
  async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    try {
      const course = await Course.findByIdAndUpdate(req.params.id, req.body, { new: true });
      if (!course) {
        return res.status(404).json({ message: "Course not found" });
      }
      res.json(course);
    } catch (error) {
      next(error);
    }
});

router.delete('/:id', async (req, res, next) => {
  try {
    const course = await Course.findByIdAndDelete(req.params.id);
    if (!course) {
      return res.status(404).json({ message: "Course not found" });
    }
    res.json({ message: "Course deleted successfully" });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
