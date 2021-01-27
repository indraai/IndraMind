class Auditory {
  constructor(opts) {
    console.log('👂 LOAD: Auditory');
    this.client = opts.client;
    this.blocks = new Array(opts.cns)
  }
}
module.exports = Auditory;
