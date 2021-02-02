module.exports = {
  key: 'senses',
  name: 'Senses',
  describe: 'Senses Index File',
  data: {
    aromas: require('./aromas.json'),
    flavors: require('./flavors.json'),
    ideas: require('./ideas.json'),
    sounds: require('./sounds.json'),
    tactile: require('./tactile.json'),
  }
}
