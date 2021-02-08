// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

// 2021-01-14 - Sub in Medical FUNCTIONS
class Medical {
  constructor(client) {
    this.client = client;
    this.state = false;
  }

  Diagnose(state) {
    this.state = state;
    this.status = 'Diagnose';
    return Promise.resolve('🥼‍ MEDICAL DIAGNOSE')
  }

  Report(state) {
    this.state = state;
    return Promise.resolve('😷 MEDICAL REPORT');
  }

  Remedy(state) {
    this.state = state;
    this.status = 'Remedy';
    return Promise.resolve('💊 MEDICAL REMEDY')
  }

  Transport(state) {
    this.state = state;
    this.status = 'Transport';
    return Promise.resolve('🚑 MEDICAL TRANSPORT')
  }

  Quarantine(state) {
    this.state = state;
    this.status = 'Quarantine';
    return Promise.resolve('🤢 MEDICAL QUARANTINE');
  }

  Services(state) {
    this.state = state;
    this.status = 'Services';
    return Promise.resolve('🏥 MEDICAL SERVICES');
  }

  // medical request/response Medical Health and Security
}
module.exports = Medical;
