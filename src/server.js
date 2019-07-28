const express = require('express');
const xss = require('xss-clean');
const hpp = require('hpp');
const rateLimit = require('express-rate-limit');
const helmet = require('helmet');
const config = require('./config');

const app = express();

const limiter = rateLimit({
  max: 100,
  windowMs: 60 * 60 * 1000,
  message: 'Too many requests from this IP, please try again in an hour!',
});

app.use(express.json({ limit: 1e6 }));
app.use(express.urlencoded({ extended: true }));

app.use(helmet());
app.use(xss());
app.use(hpp());
app.use(limiter);

app.use('/', (req, res) => {
  res.send('Pizza!');
});

app.listen(config.port, () => {
  /* eslint-disable no-console */
  console.log(`Listening on port ${config.port}`);
  /* eslint-enable no-console */
});
