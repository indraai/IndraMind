// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

const {data} = require('../../data/mind/concepts/perceptions.json');
const lib = require('../../lib/');

const {Joy, Grief, Equanimity} = require('../feelings');

function setPerceptions(_uid) {
  const record = data.find(({uid}) => uid == _uid);
  if (!record)  return false;
  const _record = lib.copy(record);
  _record.state.joy = new Joy(record.state.joy);
  _record.state.grief = new Grief(record.state.grief);
  _record.state.equanimity = new Equanimity(record.state.equanimity);
  return _record;
}
class Perceptions {
  constructor(uid) {
    this.PERCEPTION = setPerceptions(uid);
  }
}

module.exports = Perceptions;
