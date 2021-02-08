// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

// thinking.js
const {data} = require('../../data/mind/concepts/thinking.json');
const lib = require('../../lib/');

const Perceptions = require('./Perceptions.js');
const Categories = require('./Categories.js');

function setThinking(_uid) {
  const record = data.find(({uid}) => uid == _uid);
  if (!record) return false;
  const _record = lib.copy(record);
  for (let x in _record.state) {
    _record.state[x].perception = new Perceptions(record.state[x].perception);
    _record.state[x].category = new Categories(record.state[x].category);
  }
  return _record;
}

class Thinking {
  constructor(uid) {
    this.THINKING = setThinking(uid);
  }
}
module.exports = Thinking;
