// Load Indra AI Mind into Svarga
const Svarga = require('@indra.ai/svarga');

const fs = require('fs');
const path = require('path');
const {vars, me, client} = require('../data/config');
const modules = require('../modules');
const lang = require('../data/lang');
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
    Boot() {
      this.security = new this.modules.Security({
        client,
        state: this.vars,
      });
      this.modules.Mind = new modules.Mind({
        client,
        lang: lang[client.profile.lang],
      });
      this.vars.birth = this.modules.Mind.birth;

      this.modules.Psychology = new modules.Psychology({
        client,
        blocks: this.vars.blocks,
      });
      this.modules.Auditory = new modules.Auditory({
        client,
        blocks: this.vars.blocks,
      });
      // load modules
      this.client.modules.forEach(mod => {
        this.modules[mod] = new modules[mod](this.client);
      });

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

    },
    Thinking() {
      this.vars.thinking++;
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
      }).then(voiceit => {
        this.func._setVars(voiceit);
      }).catch(console.error);
    },
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
    this.client = client;
    this.func.Boot();
    return Promise.resolve(`🥛 INIT: ${this.agent.name}`)
  },
});
module.exports = {IndraMind};
