class Node {
  constructor(opts) {
    for (let opt in opts) {
      if (!this[opt]) this[opt] = opts[opt];
    }
  }

}
module.exports = Node;
