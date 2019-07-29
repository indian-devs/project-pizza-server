const superagent = require('superagent');
const assert = require('assert');
const { When, Then } = require('cucumber');

When(/^the client creates a GET request to ([/\w-:.]+) from (.*)$/, function(
  path,
  origin
) {
  this.request = superagent('GET', `localhost:5000${path}`);
  this.request.set('Origin', origin);
});

When(/^sends the request$/, function(callback) {
  this.request
    .then(response => {
      this.response = response;
      callback();
    })
    .catch(err => {
      this.response = err;
    });
});

Then(/^the request contains the header '(.*)' set to (.*)$/, function(
  header,
  value
) {
  assert.equal(this.response.headers[header], value);
});
