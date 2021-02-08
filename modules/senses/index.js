// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

module.exports = {
  Meta: {
    key: 'senses',
    name: 'Senses Modules',
    describe: 'The Modules for Senses.',
  },
  Aromas: require('./Aromas.js'),
  Flavors: require('./Flavors.js'),
  Ideas: require('./Ideas.js'),
  Sounds: require('./Sounds.js'),
  Tactile: require('./Tactile.js'),
};
