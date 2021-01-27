// Load Indra AI Mind into Svarga
const Svarga = require('@indra.ai/svarga');

const fs = require('fs');
const path = require('path');
const {vars, me, client} = require('../data/config');
const modules = require('../modules/js');

const IndraMind = new Svarga({
  agent: {
    key: me.key,
    name: me.name,
    description: me.description,
    prompt: me.prompt,
    voice: me.voice,
    profile: me.profile,
    translate(input) {
      return input.trim();
    },
    parse(input) {
      return input.trim();
    }
  },
  client,
  vars,
  listeners: {},
  deva: {},
  modules,
  func: {
    _setVars(v) {
      for (var [key,value] of iterable) {
        this.vars[key] = value;
      }
    },
    SaveState() {
      const _file = path.join(__dirname, '..', 'data', 'state', `${Date.now()}.json`);
      fs.writeFileSync(_file, JSON.stringify(this.vars));
      return _file;
    },
    BootLoader() {
      this.security = new this.modules.Security({
        client,
        state: this.vars,
      });
      this.modules.Psychology = new modules.Psychology({
        client,
        blocks: this.vars.blocks,
      });
      this.modules.Auditory = new modules.Auditory({
        client,
        blocks: this.vars.blocks,
      });
      this.client.modules.forEach(mod => {
        this.modules[mod] = new modules[mod](this.client);
      });
    },
    WhileTrue() {
      this.vars.isolation++;
      this.security.Check(this.vars).then(secCheck => {
        if (!secCheck) return false;
        this.vars.timePen = this.vars.time;
        return this.modules.Sensorium.Process(this.vars);
      }).then(senseit => {
        this.func._setVars(senseit);
        return this.modules.Volition.Process(this.vars);
      }).then(volit => {
        this.func._setVars(volit);
        return this.modules.Voice.Process(this.vars);
      }).then(voiceit =)
        this.func._setVars(voiceit);

      // Emotion();  // 2018-03-17: so emotions may influence otherwise rational thought.
        if (life == true) {  // 2018-01-21: when user checks "Halt", stop thinking.
          EnThink(); // 2017-12-31: think in English.
        }  // 2018-01-21: end of test for "life" status.
      // Motorium();  // 2018-03-17: so that emotion and thought may initiate actions.
      } // 2018-01-20: FreeWill Volition() module returns to MainLoop()
      }).catch(console.error);

      Volition(); // 2018-01-15: in conformance with modern ghost.pl AI
      if (life == true) {
        TID=window.setTimeout("MainLoop();",10000);
      }
    }
  },
  methods: {
    save() {
      return Promise.resolve({text:this.func.SaveState()});
    },
    status() {
      return Promise.resolve({text:`⏳ STATUS: ${this.agent.name} ${this.active}`})
    },
  },
  onStart() {
    // put load state in here when start... grab latest state variables.
    return Promise.resolve(`🍯 START ${this.agent.name}`);
  },
  onStop() {
    const _state = this.func.SaveState();
    return Promise.resolve(`🥣 STOP: ${this.agent.name}`);
  },
  onEnter() {
    return this.security.Enter(this.vars);
  },
  onExit() {
    return this.security.Exit(this.vars, this.func.SaveState());
  },
  onInit() {
    this.func.BootLoader();
    let i = this.vars.cns;
    while (i--) {
      this.modules.Psychology.blocks[i] = new modules.Node({
        tru: ' ',
        psi: ' ',
        hlc: ' ',
        act: ' ',
        mtx: ' ',
        jux: ' ',
        pos: ' ',
        dba: ' ',
        num: ' ',
        mfn: ' ',
        pre: ' ',
        iob: ' ',
        seq: ' ',
        tkb: ' ',
        rv: ' ',
        psyExam: ' ',
      });
      this.modules.Auditory.blocks[i] = new modules.Node({
        pho: " ",
        act: 0,
        audpsi: " ",
        AudExam: " ",
      });
    }
    return Promise.resolve(`🥛 INIT: ${this.agent.name}`)
  },
});
module.exports = {IndraMind};
