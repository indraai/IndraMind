// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

const {data} = require('../../data/mind/properties/space.json');
const lib = require('../../lib/');

function setSpace(_id) {
  return lib.copy(data.find(({id}) => id == _id));
}

class Space {
  constructor(id) {
    this.SPACE = setSpace(id);
  }
}

module.exports = Space;
