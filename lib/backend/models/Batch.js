const mongoose = require('mongoose');

const batchSchema = new mongoose.Schema({
  name: String,
  instructor: String,
});

module.exports = mongoose.model('Batch', batchSchema);
