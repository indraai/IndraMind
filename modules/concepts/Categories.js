const {Joy, Grief, Equanimity} = require('../feelings');
const lib = require('../../lib/');

const {data} = require('../../data/mind/concepts/categories.json');

function setCategories(_uid) {
  const record = data.find(({uid}) => uid == _uid);
  if (!record)  return false;
  const _record = lib.copy(record);
  _record.state.joy = new Joy(record.state.joy);
  _record.state.grief = new Grief(record.state.grief);
  _record.state.equanimity = new Equanimity(record.state.equanimity);
  return _record;
}

class Categories {
  constructor(uid) {
    this.CATEGORY = setCategories(uid);
  }
}

module.exports = Categories;
