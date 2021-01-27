class Volition {
  constructor(client) {
    this.client = client;
  }
  Process(state) {
    return Promise.resolve([
      {'alert': 'Volition has been called'},
    ])
  };

module.expots = Volition;
