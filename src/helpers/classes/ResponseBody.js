class ResponseBody {
  constructor() {
    this.error = true;
    this.message = 'Something went wrong. Please try again later';
    this.payload = {};
  }

  setSuccess() {
    this.error = false;
  }

  setMessage(message) {
    this.message = message;
  }

  setPayload({ key, value }) {
    this.payload[key] = value;
  }

  removePayload() {
    delete this.payload;
  }
}

module.exports = ResponseBody;
