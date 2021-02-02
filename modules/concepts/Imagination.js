
class Imagination {
  constructor(client) {
    console.log('💭 LOAD: Imagination');
    this.client = client;
  }

  Scan(input) {
    console.log('🐳 IMAGINATION SCAN');
    return Promise.resolve(input);
  }
};
module.exports = Imagination;
