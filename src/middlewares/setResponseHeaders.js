module.exports = (req, res, next) => {
  const allowedOrigins = ['http://localhost:3000'];
  res.setHeader('Access-Control-Allow-Methods', 'GET');

  if (allowedOrigins.includes(req.get('origin'))) {
    res.setHeader('Access-Control-Allow-Origin', req.get('origin'));
  }

  next();
};
