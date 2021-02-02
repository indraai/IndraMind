class Psychology {
  constructor(opts) {
    console.log('🤯 LOAD: Psychology');
    this.client = opts.client;
    this.blocks = new Array(opts.cns);
  }
}
module.exports = Psychology;
