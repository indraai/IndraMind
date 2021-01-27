// 2021-01-24
class Health {
  constructor(client) {
    this.client = client;
    this.state = false;
  }
  
  Report(state) {
    this.state = state;
    return Promise.resolve('HEALTH REPORT');
  }
}

module.exports = Health;
