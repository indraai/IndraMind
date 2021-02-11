// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.
// 2021-01-24 Adding Offense Measures
// Used for Defensive Returns
class Offense {
  constructor(opts) {
    this.agent = opts.agent;
    this.state = opts.state;
    this.created = Date.now();
    this.run = false;
    this.tackle = false;
    this.defense = false;
    this.strategy = false;
  }

  Strategy(defense) {
    this.defense = defense;
    this.strategy = 'OFFENSE STRATEGY';
    return Promise.resolve(this.strategy);
  }

  Run() {
    this.run = Date.now();
  }

  Tackle() {
    this.tackle = Date.now();
  }
}
module.exports = Offense;
