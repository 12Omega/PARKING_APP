const express = require('express');
const dotenv = require('dotenv');
const mongoose = require('mongoose');
const cors = require('cors');
const batchRoutes = require('./routes/batch');
const batchRoutes = require('./routes/batch');
const errorHandler = require('./middleware/errorHandler');
app.use(errorHandler);

app.use((req, res) => res.status(404).send('Not Found'));

app.use('/api/batch', batchRoutes);

app.use('/api/batch', batchRoutes);



dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());

app.get('/', (req, res) => res.send('API Running 🚀'));

mongoose.connect(process.env.MONGO_URI)
  .then(() => {
    app.listen(process.env.PORT, () =>
      console.log(`Server running on port ${process.env.PORT}`)
    );
  })
  .catch(err => console.error(err));
