const {data} = require('../../data/mind/feelings/equanimity.json');
const lib = require('../../lib/');

function setEquanimity(_uid) {
  return data.find(({uid}) => uid == _uid);
}

class Equanimity {
  constructor(uid) {
    console.log('        EQUANIMITY: ', uid);
    this.JOY = setEquanimity(uid);
  }
}

module.exports = Equanimity;
