const Health = require('./Health.js');
const Medical = require('./Medical.js');
const Defense = require('./Defense.js');
const Offense = require('./Offense.js');

class Security {
  constructor(opts) {
    console.log('🚨 LOAD: Security');

    this.client = opts.client;
    this.state = opts.state;
    this.stamp = false;
    this.enter = false;
    this.exit = false;
    this.status = false;

    this.health = new Health(opts.client);
    this.medical = new Medical(opts.client);
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

  Enter(state) {
    this.enter = Date.now();
    if (!this.client) this.client = this.Card({
      key: this.uid(),
      name: '',
      type: 'Agent|Client',
    })
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
