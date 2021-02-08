// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

module.exports = {
  Meta: {
    key: 'medical',
    name: 'Medical/Health Modules',
    describe: 'The Modules for Mecical/Health.',
  },
  Health: require('./Health.js'),
  Medical: require('./Medical.js'),
}
