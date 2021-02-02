module.exports = {
  Meta: {
    key: 'IndraMind',
    name: 'The Indra Mind',
    describe: 'The Modules and Code to run the Indra Mind.',
  },
  // Modules for IndraMInd
  Node: require('./Node.js'), // Create a new Node Class
  Mind: require('./Mind.js'), // Create MindBoot module.
  Security: require('./security/Security.js'), // Create Security
  Modules: {
    security: require('./security'), // Create Security module.
    medical: require('./medical'),
    concepts: require('./concepts'),
    conduct: require('./conduct'),
    feelings: require('./feelings'),
    properties: require('./properties'),
    qualities: require('./qualities'),
    senses: require('./senses'),
    meditation: require('./meditation'),
  }
}
