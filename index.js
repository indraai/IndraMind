#!/usr/bin/env node
// Copyright (c)2021 Quinn Michaels
// Distributed under the MIT software license, see the accompanying
// file LICENSE.md or http://www.opensource.org/licenses/mit-license.php.

const {version} = require('./package.json');
const path = require('path');
const fs = require('fs');
const chalk = require('chalk');
const fast = require('fastify')({
  logger:false,
});
const fastStatic = require('fastify-static');
const readline = require('readline');
const shell = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

const client = require('./data/config/client.json').data;
const {IndraMind} = require('./src/IndraMind.dev.js');

// setup the public directory
fast.register(fastStatic, {
  root: path.join(__dirname, 'assets', 'public'),
  prefix: '/public/',
});

fast.register(fastStatic, {
  root: path.join(__dirname, 'data'),
  prefix: '/data/',
  decorateReply: false
});

// setup routes and handlers
const handlers = {
  default(req, reply) {
    return reply.sendFile('index.html', path.join(__dirname, 'assets'));
  },
  mind(req, reply) {
    let _path = '';
    if (!req.params.section) _path = path.join(__dirname, 'data', 'mind');
    else _path = path.join(__dirname, 'data', 'mind', req.params.section);
    const mod = req.params.module ? req.params.module + '.json' : 'index.json';
    console.log('DATA PATH', _path);
    return reply.sendFile(mod, _path);
  },
  question(req, reply) {
    return IndraMind.question({
      text: req.body.text,
      created: req.body.created,
    });
  }
}
const routes = [
  {
    method: 'GET',
    url: '/',
    handler: handlers.default,
  },
  {
    method: 'GET',
    url: '/mind',
    handler: handlers.mind,
  },
  {
    method: 'GET',
    url: '/mind/:section',
    handler: handlers.mind,
  },
  {
    method: 'GET',
    url: '/mind/:section/:module',
    handler: handlers.mind,
  },
  {
    method: 'POST',
    url: '/question',
    handler: handlers.question
  }
]
routes.forEach(rt => {
  fast.route(rt);
});


function shellPrompt(_prompt, _text) {
  const {label,text} = _prompt.colors; // set client prompt colors
  shell.setPrompt(chalk.rgb(label.R, label.G, label.B)(`${_prompt.emoji} ${_prompt.text}: `));
  shell.prompt();
  if (_text) console.log(chalk.rgb(text.R, text.G, text.B)(_text));
  shell.prompt();
}

function indraFlash() {
return `
██╗███╗░░██╗██████╗░██████╗░░█████╗░
██║████╗░██║██╔══██╗██╔══██╗██╔══██╗
██║██╔██╗██║██║░░██║██████╔╝███████║
██║██║╚████║██║░░██║██╔══██╗██╔══██║
██║██║░╚███║██████╔╝██║░░██║██║░░██║
╚═╝╚═╝░░╚══╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝
`;
}

fast.listen(client.profile.port).then(() => {
  console.log(`PORT: ${client.profile.port}`);
  console.log('---------------');
  console.log(`🍚 CLIENT:`);
  console.log(JSON.stringify(client, null, 2));
  console.log('---------------');
  // Initialize Indra
  return IndraMind.init();
}).then(_init => {
  console.log('---------------');
  console.log(_init);
  return IndraMind.start();
}).then(_start => {
  console.log(_start);
  return IndraMind.enter();
}).then(_enter => {
  console.log(_enter);
  console.log(indraFlash());
  console.log('---------------');
  shellPrompt(client.prompt, `Hello there ${client.profile.name}`);
  shellPrompt(client.prompt, `It's wonderful that you could join me today.`);
  shellPrompt(client.prompt, `What would you like to talk about?`);

  shell.on('line', question => {
    if (question === '!exit') return shell.close();
    IndraMind.question({
      text: question,
      created: Date.now(),
    }).then(answer => {
      shellPrompt(answer.a.agent.prompt, answer.a.text);
      shellPrompt(client.prompt, '');
      // console.log('ANSWER', JSON.stringify(answer, null, 2));
    }).catch(console.error);

  }).on('pause', () => {

  }).on('resume', () => {

  }).on('close', () => {
    shell.setPrompt('');
    shell.prompt();
    IndraMind.exit().then(_exit => {
      console.log('---------------');
      console.log(_exit);
      return IndraMind.stop();
    }).then(_stop => {
      console.log(_stop);
      console.log('---------------');
      process.exit(0);
    }).catch(console.error);
  }).on('SIGCONT', () => {
  }).on('SIGINT', data => {
    shell.close();
  }).on('SIGSTOP', () => {
  });
}).catch(console.error);
