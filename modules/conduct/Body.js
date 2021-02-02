const {data} = require('../../data/mind/conduct/body.json');
const lib = require('../../lib/');

function setBody(_uid) {
  return lib.copy(data.find(({uid}) => uid == _uid));
}

class Body {
  constructor(uid) {
    console.log('            BODY: ', uid);
    this.BODY = setBody(uid);
  }
}

module.exports = Body;
