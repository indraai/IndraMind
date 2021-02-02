const {data} = require('../../data/mind/properties/earth.json');
const lib = require('../../lib/');

function setEarth(_id) {
  return lib.copy(data.find(({id}) => id == _id));
}

class Earth {
  constructor(id) {
    console.log('            EARTH: ', id);
    this.EARTH = setEarth(id);
  }
}

module.exports = Earth;
