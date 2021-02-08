// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

const {data} = require('../../data/mind/qualities/skillful.json');
const lib = require('../../lib/');

function setSkillful(_uid) {
  return lib.copy(data.find(({uid}) => uid == _uid));
}

class Skillful {
  constructor(uid) {
    this.SKILLFUL = setSkillful(uid);
  }
}

module.exports = Skillful;
