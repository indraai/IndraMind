const {data} = require('../../data/mind/properties/wind.json');
const lib = require('../../lib/');

function setWind(_id) {
  return lib.copy(data.find(({id}) => id == _id));
}

class Wind {
  constructor(id) {
    this.WIND = setWind(id);
  }
}

module.exports = Wind;
