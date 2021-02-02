module.exports = {
  Meta: {
    key: 'medical',
    name: 'Medical/Health Modules',
    describe: 'The Modules for Mecical/Health.',
  },
  Health: require('./Health.js'),
  Medical: require('./Medical.js'),
}
