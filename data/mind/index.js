// Copyright (c)2021 Quinn Michaels. All rights reserved.

module.exports = {
  key: 'mind',
  name: 'Mind',
  describe: 'The Indra Mind',
  data: {
    concepts: require('./concepts'),
    conduct: require('./conduct'),
    feelings: require('./feelings'),
    senses: require('./senses'),
    properties: require('./properties'),
    qualities: require('./qualities'),
  }
}
