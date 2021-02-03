// these variable index codes will reference desire index codes
const {data} = require('../../data/mind/concepts/dearest.json');
const lib = require('../../lib/');

const Desires = require('./Desires.js');

function setDearest(input) {
  const record = data.find(({key}) => key == input);
  if (!record) return false;
  const _record = lib.copy(record);
  for (let x in _record.state) {
    _record.state[x] = new Desires(record.state[x]);
  }
  return _record;
}

class Dearest {
  constructor(input) {
    this.input = input;
    this.DEAREST = setDearest(input);
  }
  get Birth() {
    return this.DEAREST.birth;
  }
  get Cause() {
    return this.DEAREST.cause;
  }
  get Origin() {
    return this.DEAREST.origin;
  }
  get Source() {
    return this.DEAREST.source;
  }
}

module.exports = Dearest;
