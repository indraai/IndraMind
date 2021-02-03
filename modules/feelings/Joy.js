const {data} = require('../../data/mind/feelings/joy.json');
const lib = require('../../lib/');

function setJoy(_uid) {
  return lib.copy(data.find(({uid}) => uid == _uid));
}

class Joy {
  constructor(uid) {
    this.JOY = setJoy(uid);
  }
}

module.exports = Joy;
