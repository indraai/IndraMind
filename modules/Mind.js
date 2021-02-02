const Dearest = require('./concepts/Dearest.js');
const Creativity = require('./concepts/Creativity.js');
const Imagination = require('./concepts/Imagination.js');
const Awareness = require('./concepts/Awareness.js');

class Mind {
  constructor(opts) {
    console.log('🧠 LOAD: Mind');
    this.birth = opts.birth || Date.now();
    this.client = opts.client;
    this.lang = opts.lang;
    this.state = opts.state;
    this.security = opts.security;
    this.awareness = new Awareness(opts.client);
    this.imagination = new Imagination(opts.client);
    this.creativity = new Creativity(opts.client);
  }

  Dearest(input) {
    return Promise.resolve(new Dearest(input));
  }

  Question(input) {
    return this.security.Scan(input).then(secScan => {
      return this.awareness.Scan(secScan);
    }).then(awaScan => {
      return this.imagination.Scan(awaScan);
    }).then(imaScan => {
      return this.creativity.Scan(imaScan);
    }).then(creScan => {
      return this.Dearest(creScan);
    }).catch(console.error);
  }
}

module.exports = Mind;
