// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

const {data} = require('../../data/mind/conduct/search.json');
const lib = require('../../lib/');

function setSearch(_uid) {
  return lib.copy(data.find(({uid}) => uid == _uid));
}

class Search {
  constructor(uid) {
    this.SEARCH = setSearch(uid);
  }
}

module.exports = Search;
