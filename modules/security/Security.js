// COPYRIGHT (c)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.

const {Health, Medical} = require('../medical');
const Defense = require('./Defense.js');
const Offense = require('./Offense.js');

class Security {
  constructor(opts) {
    console.log('🚨 LOAD: Security');

    this.agent = opts.agent;
    this.state = opts.state;
    this.stamp = false;
    this.enter = false;
    this.exit = false;
    this.status = false;

    this.health = new Health(opts.agent);
    this.medical = new Medical(opts.agent);
  }

  Card(opts) {
    return {
      title: 'Card',
      describe: 'Indra Network Profile Card',
      data: {
        key: opts.key,
        name: opts.name,
        describe: "",
        prompt: {
          emoji: "",
          text: opts.type,
          colors: {
            label: {
              R: 255,
              G: 0,
              B: 210
            },
            text: {
              R: 255,
              G: 116,
              B: 230
            }
          }
        },
        profile: {
          name: '',
          describe: '',
          avatar: '',
          background: '',
          gender: '',
          port: 9393
        },
        services: {}
      }
    }
  }

  Health() {
    return Promise.resolve(this.health.Report(this.state));
  }

  Medical() {
    return Promise.resolve(this.medical.Report(this.state));
  }

  Log(state) {
    this.state = state;
    this.stamp = Date.now();
  }

  Check(state) {
    this.status = 'Check';
    this.Log(state);
    return Promise.resolve('🔓 SECURITY: Granted');
  }

  Scan(input) {
    this.status = 'Scan',
    console.log('🚨 SECURITY SCAN');
    return Promise.resolve(input);
  }
  Authority() {
    this.status = 'Authority';
    this.Log(state);
  }

  Monitor(state) {
    this.status = 'Monitor';
    this.Log(state);
  }

  Track(state) {
    this.status = 'Track';
    this.Log(state);
  }

  Report(state) {
    this.status = 'Report';
    this.Log(state);
  }

  Alert(state) {
    this.status = 'Alert';
    this.Log(state);
  }

  Isolate(state) {
    this.status = 'Isolate';
    this.Log(state);
    // Isolate a client in a _state
  }

  Quarantine(state) {
    this.status = 'Quarantine';
    this.Log(state);
    // quarantine a client in a _state
  }

  Defend(state) {
    this.staus = 'Defend';
    this.Log(state);

    const D = new Defense({
      client: this.client,
      state,
    });
    const O = new Offense({
      client: this.client,
      state,
    });
    return new Promise((resolve, reject) => {
      D.Strategy().then(defense => {
        return O.Strategy(defense);
      }).then(offense => {
        return O.Run();
      }).then(tackle => {
        return resolve(O.Tackle())
      }).catch(err => {
        // catch and evaluate any errors in strategy;
        return reject(err)
      });
    });
  }

  Enter(key, state) {
    this.enter = Date.now();
    if (!this.agent) this.agent = this.Card({
      key,
      name: '',
    });
    this.Log(state);
    this.Health();
    this.Check();
    return Promise.resolve(`ENTER ⮕ 👮‍♂️✅`);
  }

  Exit(state, file) {
    this.exit = Date.now();
    this.Log(state);
    return Promise.resolve(`✅👮‍♂️ ⬅ EXIT`);
  }
}

module.exports = Security;
