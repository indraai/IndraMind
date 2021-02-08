// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

// sub for awareness
class Awareness {
  constructor(client) {
    console.log('🧐 LOAD: Awareness');
    this.client = client;
  }
  // insert awareness here;
  Scan(input) {
    console.log('🥛 AWARENESS SCAN');
    return Promise.resolve(input);
  }
};

module.exports = Awareness;
