const {data} = require('../../data/mind/meditation/tune.json');
const lib = require('../../lib/');

function setTune(_uid) {
  return lib.copy(data.find(({uid}) => uid == _uid));
}

class Tune {
  constructor(uid) {
    console.log('            TUNE: ', uid);
    this.TUNE = setTune(uid);
  }
}

module.exports = Tune;
