// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

class Node {
  constructor(opts) {
    for (let opt in opts) {
      if (!this[opt]) this[opt] = opts[opt];
    }
  }

}
module.exports = Node;
