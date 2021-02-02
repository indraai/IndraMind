// 2021-01-24
class Health {
  constructor(client) {
    this.client = client;
    this.state = false;
    this.status = 'Clean'
  }

  Care(state) {
    this.state = state;
    this.status = 'Care';
    return Promise.resolve('🧽 HEALTH CARE')
  }

  Clean(state) {
    this.state = state;
    this.status = 'Clean';
    return Promise.resolve('💪 HEALTH CLEAN')
  };

  Dirty(state) {
    this.state = state;
    this.status = 'Dirty';
    return Promise.resolve('💩 HEALTH DIRTY')
  };

  Scan(state) {
    this.state = state;
    this.status = 'Scan';
    return Promise.resolve('👟 HEALTH SCAN');
  }

  Monitor(state) {
    this.state = state;
    this.status = 'Monitor';
    return Promise.resolve('🤸 HEALTH MONITOR');
  }

  Report(state) {
    this.state = state;
    this.status = 'Report';
    return Promise.resolve('📈 HEALTH REPORT');
  }

  Services(state) {
    this.state = state;
    this.status = 'Services';
    return Promise.resolve('🧻 HEALTH SERVICES');
  }

}

module.exports = Health;
