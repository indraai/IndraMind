const {data} = require('../../data/mind/conduct/search.json');
const lib = require('../../lib/');

function setSearch(_uid) {
  return lib.copy(data.find(({uid}) => uid == _uid));
}

class Search {
  constructor(uid) {
    console.log('            SEARCH: ', uid);
    this.SEARCH = setSearch(uid);
  }
}

module.exports = Search;
