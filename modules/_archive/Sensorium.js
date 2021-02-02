class Sensorium {
  constructor(client) {
    console.log('🥲  LOAD: Sensorium');
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
