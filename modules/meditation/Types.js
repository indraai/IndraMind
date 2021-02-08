// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

const {data} = require('../../data/mind/meditation/types.json');
const lib = require('../../lib/');

function setTypes(_uid) {
  return lib.copy(data.find(({uid}) => uid == _uid));
}

class Types {
  constructor(uid) {
    this.TYPES = setTypes(uid);
  }
}

module.exports = Types;
