const {data} = require('../../data/mind/properties/fire.json');
const lib = require('../../lib/');

function setFire(_id) {
  return lib.copy(data.find(({id}) => id == _id));
}

class Fire {
  constructor(id) {
    this.FIRE = setFire(id);
  }
}

module.exports = Fire;
