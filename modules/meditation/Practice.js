// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

const {data} = require('../../data/mind/meditation/practice.json');
const lib = require('../../lib/');

function setPractice(_uid) {
  return lib.copy(data.find(({uid}) => uid == _uid));
}

class Practice {
  constructor(uid) {
    this.PRACTICE = setPractice(uid);
  }
}

module.exports = Practice;
