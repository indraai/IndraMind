// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

const {data} = require('../../data/mind/concepts/desires.json');
const lib = require('../../lib/');

const Thinking = require('./Thinking.js');

function setDesires(_uid) {
  const record = data.find(({uid}) => uid == _uid);
  if (!record) return false;
  const _record = lib.copy(record);
  for (let x in record.state) {
    _record.state[x] = new Thinking(record.state[x]);
  }
  return _record;
}

class Desires {
  constructor(uid) {
    this.DESIRE = setDesires(uid);
  }
}

module.exports = Desires;
