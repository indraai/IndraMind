const {data} = require('../../data/mind/properties/water.json');
const lib = require('../../lib/');

function setWater(_id) {
  return lib.copy(data.find(({id}) => id == _id));
}

class Water {
  constructor(id) {
    this.WATER = setWater(id);
  }
}

module.exports = Water;
