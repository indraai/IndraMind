// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

const {data} = require('../../data/mind/feelings/equanimity.json');
const lib = require('../../lib/');

const Skillful = require('../qualities/Skillful.js');
const Unskillful = require('../qualities/Unskillful.js');

function setEquanimity(_uid) {
  const record = data.find(({uid}) => uid == _uid);
  if (!record) return false;
  // let's get the skillful and unskillful attributes here
  const _record = lib.copy(record);
  record.state.skillful.forEach((v,i) => {
    _record.state.skillful[i] = new Skillful(v);
  });
  record.state.unskillful.forEach((v,i) => {
    _record.state.unskillful[i] = new Unskillful(v);
  });
  return
}

class Equanimity {
  constructor(uid) {
    this.EQUANIMITY = setEquanimity(uid);
  }
}

module.exports = Equanimity;
