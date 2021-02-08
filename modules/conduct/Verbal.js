// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

const {data} = require('../../data/mind/conduct/search.json');
const lib = require('../../lib/');

function setVerbal(_uid) {
  return lib.copy(data.find(({uid}) => uid == _uid));
}

class Verbal {
  constructor(uid) {
    this.VERBAL = setVerbal(uid);
  }
}

module.exports = Verbal;
