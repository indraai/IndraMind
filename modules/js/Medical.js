// 2021-01-14 - Sub in Medical FUNCTIONS
class Medical {
  constructor(client) {
    this.client = client;
    this.state = false;
  }
  Report(state) {
    this.state = state;
    return Promise.resolve('MEDICAL REPORT');
  }
  // medical request/response Medical Health and Security
}
module.exports = Medical;
