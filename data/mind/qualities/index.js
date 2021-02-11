// Copyright (c)2021 Quinn Michaels. All rights reserved.

module.exports = {
  key: 'qualities',
  name: 'Qualities',
  describe: 'Qualities Index File',
  data: {
    skilled: require('./skilled.json'),
    unskilled: require('./unskilled.json'),
  }
}
