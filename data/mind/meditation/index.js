// Copyright (c)2021 Quinn Michaels. All rights reserved.

module.exports = {
  key: 'meditation',
  name: 'Meditation',
  describe: 'Meditation Index File',
  data: {
    practice: require('./practice.json'),
    tune: require('./tune.json'),
    types: require('./types.json'),
  }
}
