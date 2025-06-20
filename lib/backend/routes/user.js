const express = require('express');
const router = express.Router();
const User = require('../models/User');
const { body, validationResult } = require('express-validator');

// Middleware to handle validation results
const validate = (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  next();
};

// POST: Create a new user
router.post(
  '/',
  [
    body('email').isEmail().withMessage('Valid email is required'),
    // For a real app, password should be present and hashed.
    // For this task, we'll keep it simple.
    body('password').notEmpty().withMessage('Password is required'),
  ],
  validate,
  async (req, res, next) => {
    try {
      // In a real app, hash password before saving:
      // const salt = await bcrypt.genSalt(10);
      // const hashedPassword = await bcrypt.hash(req.body.password, salt);
      // const user = new User({ email: req.body.email, password: hashedPassword });
      const user = new User(req.body); // Simplified for this task
      await user.save();
      res.status(201).json(user);
    } catch (error) {
      next(error);
    }
  }
);

// GET: Get all users
router.get('/', async (req, res, next) => {
  try {
    const users = await User.find().select('-password'); // Exclude password
    res.json(users);
  } catch (error) {
    next(error);
  }
});

// GET: Get a specific user by ID
router.get('/:id', async (req, res, next) => {
  try {
    const user = await User.findById(req.params.id).select('-password');
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }
    res.json(user);
  } catch (error) {
    next(error); // Pass to error handler for CastError etc.
  }
});

// PUT: Update a user by ID
router.put(
  '/:id',
  [
    body('email').optional().isEmail().withMessage('Valid email is required'),
    // Add other fields as needed, e.g., password update would require special handling
  ],
  validate,
  async (req, res, next) => {
    try {
      // Exclude password from direct update via this route for simplicity.
      // Password updates should be handled separately and securely.
      const { password, ...updateData } = req.body;
      const user = await User.findByIdAndUpdate(
        req.params.id,
        { $set: updateData },
        { new: true, runValidators: true }
      ).select('-password');

      if (!user) {
        return res.status(404).json({ message: 'User not found' });
      }
      res.json(user);
    } catch (error) {
      next(error);
    }
  }
);

// DELETE: Delete a user by ID
router.delete('/:id', async (req, res, next) => {
  try {
    const user = await User.findByIdAndDelete(req.params.id);
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }
    res.json({ message: 'User deleted successfully' });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
