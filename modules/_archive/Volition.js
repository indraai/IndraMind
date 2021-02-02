class Volition {
  constructor(client) {
    console.log('🛫 LOAD: Volition');
    this.client = client;
  }
  Process(state) {
    return Promise.resolve([
      {'alert': 'Volition has been called'},
    ])
  }
}
module.exports = Volition;
