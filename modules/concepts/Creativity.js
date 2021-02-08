// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

// sub for creativity
class Creativity {
  constructor(client) {
    console.log(`🎨 LOAD: Creativity`);
    this.client = client;
  }
  // insert creativity code here;

  Scan(input) {
    console.log('🍪 CREATIVITY SCAN');
    return Promise.resolve(input);
  }
};


module.exports = Creativity;
