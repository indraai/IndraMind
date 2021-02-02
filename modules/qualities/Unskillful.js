const {data} = require('../../data/mind/qualities/unskillful.json');
const lib = require('../../lib/');

function setUnskillful(_id) {
  return lib.copy(data.find(({id}) => id == _id));
}

class Skillful {
  constructor(id) {
    console.log('          UNSKILLFUL: ', id);
    this.SKILLFUL = setUnskillful(id);
  }
}

module.exports = Skillful;
