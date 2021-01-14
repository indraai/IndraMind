#!/usr/bin/env node
// Copyright (c)2020 Quinn Michaels
// Distributed under the MIT software license, see the accompanying
// file LICENSE.md or http://www.opensource.org/licenses/mit-license.php.

const path = require('path');
const fs = require('fs');

const fast = require('fastify')({
  logger:true
});

const fastStatic = require('fastify-static');

// setup the public directory
fast.register(fastStatic, {
  root: path.join(__dirname, 'assets', 'public'),
  prefix: '/public/',
});

// setup default index.html file serve
fast.get('/', function (req, reply) {
  return reply.sendFile('index.html', path.join(__dirname, 'assets'));
})

// setup Indra Mind direct link
fast.get('/IndraMind', function (req, reply) {
  return reply.sendFile('IndraMind.js', path.join(__dirname, 'src'));
})

fast.listen(93).then(() => {
  console.log('INDRA IS LISTENING:93');
});
