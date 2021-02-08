// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

class Defense {
  constructor(opts) {
    this.client = opts.client;
    this.state = opts.state;
    this.created = Date.now();
    this.strategy = false;
  }
  Strategy() {
    this.strategy = 'DEFENSE STRATEGY';
    return Promise.resolve(this.strategy);
  }
}

module.exports = Defense;
