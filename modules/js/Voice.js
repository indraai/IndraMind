class Voice {
  constructor(client) {
    console.log('🎙  LOAD: Voice');
    this.client = client;
  }
  Process(state) {
    return Promise.resolve([
      {'outputPlus': state.output},
    ])
  }
};

module.exports = Voice;
