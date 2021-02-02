const {data} = require('../../data/mind/properties/space.json');
const lib = require('../../lib/');

function setSpace(_id) {
  return lib.copy(data.find(({id}) => id == _id));
}

class Space {
  constructor(id) {
    console.log('            SPACE: ', id);
    this.SPACE = setSpace(id);
  }
}

module.exports = Space;
