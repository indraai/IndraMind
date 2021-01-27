class Sensorium {  // http://ai.neocities.org/Sensorium.html
  constructor(client) {
    this.client = client;
  }
  Process() {
    return Promise.resolve([
      {chrLen: 0},
      {verbCon: 0},
    ]);
  }
}

module.exports = Sensorium;
