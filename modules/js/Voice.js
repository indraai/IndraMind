class Voice {
  constructor(client) {
    this.client = client;
  }
  Process(state) {
    return Promise.resolve([
      {'outputPlus': state.output},
    ])
  }
};

module.expots = Voice;
