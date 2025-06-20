const dotenv = require('dotenv');
dotenv.config(); // Load environment variables first

const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const errorHandler = require('./middleware/errorHandler');

// Route imports
const batchRoutes = require('./routes/batch');
const courseRoutes = require('./routes/course'); // Assuming this exists or will be added
const userRoutes = require('./routes/user');

const app = express();

// Middleware
app.use(cors());
app.use(express.json()); // Body parser for JSON requests

// Simple GET route for API status
app.get('/api', (req, res) => res.send('API Running 🚀'));

// API routes
app.use('/api/users', userRoutes);
app.use('/api/batches', batchRoutes); // Changed to /api/batches for consistency
app.use('/api/courses', courseRoutes); // Changed to /api/courses

// Error Handling Middleware - should be after routes
app.use(errorHandler);

// 404 Handler for undefined routes - should be the last middleware
app.use((req, res, next) => {
  res.status(404).json({ message: 'Resource not found on this server' });
});

// MongoDB Connection and Server Start
const PORT = process.env.PORT || 5000; // Default port if not specified
const MONGO_URI = process.env.MONGO_URI;

if (!MONGO_URI) {
  console.error("FATAL ERROR: MONGO_URI is not defined.");
  process.exit(1); // Exit if DB connection string is missing
}

mongoose.connect(MONGO_URI)
  .then(() => {
    console.log('MongoDB Connected...');
    app.listen(PORT, () =>
      console.log(`Server running on port ${PORT}`)
    );
  })
  .catch(err => {
    console.error('MongoDB connection error:', err.message);
    process.exit(1); // Exit on connection error
  });
