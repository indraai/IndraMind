const {data} = require('../../data/mind/qualities/unskillful.json');
const lib = require('../../lib/');

function setUnskillful(_uid) {
  return lib.copy(data.find(({uid}) => uid == _uid));
}

class Unskillful {
  constructor(uid) {
    this.UNSKILLFUL = setUnskillful(uid);
  }
}

module.exports = Unskillful;
