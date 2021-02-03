const {data} = require('../../data/mind/feelings/grief.json');
const lib = require('../../lib/');

function setGrief(_uid) {
  return data.find(({uid}) => uid == _uid);
}

class Grief {
  constructor(uid) {
    this.GRIEF = setGrief(uid);
  }
}

module.exports = Grief;
