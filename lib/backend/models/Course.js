const mongoose = require('mongoose');

const courseSchema = new mongoose.Schema({
  title: String,
  credits: Number,
});

module.exports = mongoose.model('Course', courseSchema);
