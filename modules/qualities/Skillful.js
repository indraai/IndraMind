const {data} = require('../../data/mind/qualities/skillful.json');
const lib = require('../../lib/');

function setSkillful(_id) {
  return lib.copy(data.find(({id}) => id == _id));
}

class Skillful {
  constructor(id) {
    console.log('          SKILLFUL: ', id);
    this.SKILLFUL = setSkillful(id);
  }
}

module.exports = Skillful;
