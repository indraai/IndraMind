// COPYRIGHT (C)2021 QUINN MICHAELS. ALL RIGHTS RESERVED.
// Load Indra AI Mind into Svarga
const Svarga = require('@indra.ai/svarga');

const fs = require('fs');
const path = require('path');
const {vars, agent, client} = require('../data/config');
const {Modules, Security, Mind} = require('../modules');
const lang = require('../data/lang');

const IndraMind = new Svarga({
  agent: {
    key: agent.key,
    name: agent.name,
    description: agent.description,
    prompt: agent.prompt,
    voice: agent.voice,
    profile: agent.profile,
    translate(input) {
      return input.trim();
    },
    parse(input) {
      return input.trim();
    }
  },
  client,
  vars: {},
  listeners: {},
  deva: {},
  modules: {},
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
      this.vars.birth = Date.now();

      this.security = new Security({
        agent,
        state: this.vars,
      });

      this.modules.Mind = new Mind({
        agent,
        lang: lang[agent.profile.lang],
        birth: this.vars.birth,
        state: this.vars,
        security: this.security,
      });

      if (this.agent.modules) this.agent.modules.forEach(mod => {
        this.modules[mod] = new Modules[mod](this.agent);
      });

      // let i = this.vars.blocks;
      // while (i--) {
      //   this.modules.Psychology[i] = new modules.Node({});
      //   this.modules.Auditory[i] = new modules.Node({});
      // }
    },

    question(packet) {
      return new Promise((resolve, reject) => {
        if (!packet.id) return reject('NO PACKET ID');
        this.modules.Mind.Question(packet.q.text).then(answer => {
          return resolve({text: 'answer', data: answer});
        }).catch(reject);
      });
    },
    conduct(type, packet) {
      return Promise.resolve({text: `CONDUCT: ${type}`});
    },
    meditation(packet) {
      return Promise.resolve({text: `MEDITATION`})
    },
  },
  methods: {
    question(packet) {
      return this.func.question(packet);
    },

    client(packet) {
      return Promise.resolve({text: this.client.name});
    },
    agent(packet) {
      return Promise.resolve({text: this.agent.name});
    },

    corpus(packet) {},

    lang(packet) {},

    mind(packet) {},

    reports(packet) {},

    mail(packet) {},

    state(packet) {},

    docs(packet) {},

    help(packet) {},


    body(packet) {
      return this.func.conduct('body', packet);
    },
    verbal(packet) {
      return this.func.conduct('verbal', packet);
    },
    search(packet) {
      return this.func.conduct('search', packet);
    },
    meditation(packet) {
      return this.func.meditation(packet);
    },
    uid() {
      return Promise.resolve({text:this.uid()});
    },
    save() {
      return Promise.resolve({text:this.func.SaveState()});
    },
    status() {
      return Promise.resolve({text:`⏳ STATUS: ${this.agent.name} ${this.active}`})
    },
  },
  onStart() {
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
    this.vars = vars;
    this.func.Boot();
    return Promise.resolve(`🥛 INIT: ${this.agent.name}`)
  },
});
module.exports = {IndraMind};
