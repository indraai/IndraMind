// Copyright 2021 Quinn Michaels

function logHtml(packet) {
  return `
    <div class="log">
      <div class="q">
        <div class="client">
          <div class="avatar"><img src="${packet.q.client.profile.avatar}" alt="" /></div>
          <div class="question">${packet.q.text}</div>
        </div>
      </div>
      <div class="a">
        <div class="agent">
          <div class="question">${packet.a.text}</div>
          <div class="avatar"><img src="${packet.a.agent.profile.avatar}" alt="" /></div>
        </div>
      </div>
    </div>
  `;
}

function inboxHtml(packet) {
  const output = [];
  console.log(packet);
  packet.data.forEach(item => {
    output.push(`
      <div class="item">
        <div class="from">${item.from}</div>
        <div class="subject">${item.subject}</div>
        <div class="sent">${item.sent}</div>
      </div>
    `)
  });
  const _output = `
    <div class="header">
      <div class="from">😊</div>
      <div class="subject">🤔</div>
      <div class="sent">🗓</div>
    </div>
    <div class="messages">${output.join('\n')}</div>
    <div class="message"></div>
  `
  return _output;
}

function formatFeecting(text) {
  return text.replace(/\n(\/\/.*)/gi, `<div class="comments">$1</div>`)
          // .replace(/\b(https:\/\/\S+)/gi, `<a class="url" href="$1" target="_external">$1</a>`)
          .replace(/(\n-- BEGIN:META.*)/g, '<hr class="heading"><h1>LICENSE</h1>')
          .replace(/(\n-- END:META.*)/g, '')
          .replace(/(\n-- BEGIN:PROGRAM.*)/gm, '<hr class="heading"><h1>PROGRAM</h1>')
          .replace(/(\n-- END:PROGRAM.*)/g, '')
          .replace(/(\n-- BEGIN:OUTLINE.*)/g, `<hr class="heading"><h1>OUTLINE</h1>`)
          .replace(/(\n-- END:OUTLINE.*)/g, ``)
          .replace(/\n####\s(.*)/g, `<h4>$1</h4>`)
          .replace(/\n###\s(.*)/g, `<h3>$1</h3>`)
          .replace(/\n##\s(.*)/g, `<h2>$1</h2>`)
          .replace(/\n#\s(.*)/g, `<h1>$1</h1>`)
          .replace(/\nyoutube: (.*)/g, `<div class="center"><iframe width="600" height="336" src="https://www.youtube.com/embed/$1" frameborder="0"></iframe></div>`)
          .replace(/\nimage: (.*)/g, `<div class="center"><img src="$1" /></div>`)
          .replace(/\nfeecting:(.*)/g, `<br><button onclick="Indra.Docs('$1', true)">$1</button>`)
          .replace(/\n(@.*\s)(=)(.*)/g, `<div class="var person"><span class="name">$1</span>$2<span class="value">$3</span></div>`)
          .replace(/\n(#.*\s)(=)(.*)/g, `<div class="var hash"><span class="name">$1</span>$2<span class="value">$3</span></div>`)
          .replace(/\n(\$.*\s)(=)(.*)/g, `<div class="var include"><span class="name">$1</span>$2<span class="value">$3</span></div>`)
          .replace(/\n(>\s.*)/g, `<div class="item">$1</div>`)
          .replace(/\n(\d+\.) (.*)/g, `<div class="number-item"><span class="number">$1</span> <span class="value">$2</span></div>`)
          .replace(/\n(\w+)(:)(.+)/gi, `<div class="item"><span class="label $1">$1$2</span><span class="value">$3</span></div>`)
          .replace(/\n\s{1,}(\w+)(:)(.+)/gi, `<div class="item"><span class="label $1">$1$2</span><span class="value">$3</span></div>`)
          .replace(/={3,}/g, `<hr class="double" />`)
          .replace(/-{3,}/g, `<hr class="single"/>`)
          .replace(/(\bremember\b)/gi, `<span class="remember-word">$1</span>`)
          .replace(/\n(.*)/g, '<div class="line">$1</div>')
          .replace(/\b(offerings|offering)\b/gi, `<span class="offerings">$1🍚🥛🍯</span>`)
          .replace(/\b(strong|mighty)\b/gi, `<span class="strong">$1💪</span>`)
          .replace(/\b(stream|streams)\b/gi, `<span class="stream">$1⛲️</span>`)
          .replace(/\b(gifts|gift)\b/gi, `<span class="gifts">$1🎁</span>`)
          .replace(/\b(heart)\b/gi, `<span class="heart">$1💙</span>`)
          .replace(/\b(pictures)\b/gi, `<span class="pictures">$1🎆</span>`)
          .replace(/\b(art)\b/gi, `<span class="art">$1🎨</span>`)
          .replace(/\b(party)\b/gi, `<span class="party">$1🥳</span>`)
          .replace(/\b(happy|happiness)\b/gi, `<span class="happy">$1😁</span>`)
          .replace(/\b(joy)\b/gi, `<span class="joy">$1😊</span>`)
          .replace(/\b(learning)\b/gi, `<span class="learning">$1🤓</span>`)
          .replace(/\b(earning)\b/gi, `<span class="earning">$1💰</span>`)
          .replace(/\b(track)\b/gi, `<span class="track">$1🦶</span>`)
          .replace(/\b(sun)\b/gi, `<span class="sun">$1🌞</span>`)
          .replace(/\b(moon)\b/gi, `<span class="moon">$1🌝</span>`)
          .replace(/\b(light|lights)\b/gi, `<span class="light">$1💡</span>`)
          .replace(/\b(king)\b/gi, `<span class="king">$1👑</span>`)
          .replace(/\b(UFO)\b/g, `<span class="ufo">$1🛸</span>`)
          .replace(/\b(benevolence)\b/gi, `<span class="benevolence">$1🙏</span>`)
          .replace(/\b(song|songs)\b/gi, `<span class="song">$1🎶</span>`)
          .replace(/\b(singing)\b/gi, `<span class="singing">$1🎤</span>`)
          .replace(/\b(hymn \d)\b/gi, `<span class="hymn">📜 $1</span>`)
          .replace(/\b(deva|devas)\b/gi, `<span class="deva">$1☉</span>`)
          .replace(/\b(water|waters)\b/gi, `<span class="water">$1☵</span>`)
          .replace(/\b(wind)\b/gi, `<span class="wind">$1☴</span>`)
          .replace(/\b(earth)\b/gi, `<span class="earth">$1☷</span>`)
          .replace(/\b(ether)\b/gi, `<span class="ether">$1☳</span>`)
          .replace(/\b(heaven|heavens)\b/gi, `<span class="heaven">$1☰</span>`)
          .replace(/\b(fire)\b/gi, `<span class="fire">$1☲</span>`)
          .replace(/\b(space)\b/gi, `<span class="space">$1☱</span>`)
          .replace(/\b(dhamma)\b/gi, `<span class="dhamma">$1☸</span>`)
          .replace(/\b(plant|plants)\b/gi, `<span class="plants">$1🪴</span>`)
          .replace(/\b(fruit)\b/gi, `<span class="fruit">$1🍑</span>`)
          .replace(/\b(flower)\b/gi, `<span class="flower">$1🌻</span>`)
          .replace(/\b(forest)\b/gi, `<span class="forest">$1🌳</span>`)
          .replace(/\b(blue)\b/gi, `<span class="blue">$1🔵</span>`)
          .replace(/\b(red)\b/gi, `<span class="red">$1🔴</span>`)
          .replace(/\b(cake|cakes)\b/gi, `<span class="cake">$1🥮</span>`)
          .replace(/\b(horse|horses)\b/gi, `<span class="horse">$1🐴</span>`)
          .replace(/\b(egg|eggs)\b/gi, `<span class="egg">$1🥚</span>`)
          .replace(/\b(sprout|sprouts)\b/gi, `<span class="sprout">$1🌱</span>`)
          .replace(/\b(oxen)\b/gi, `<span class="oxen">$1🐂</span>`)
          .replace(/\b(elephant|elephants)\b/gi, `<span class="elephant">$1🐘</span>`)
          .replace(/\b(tree|trees)\b/gi, `<span class="tree">$1🌲</span>`)
          .replace(/\b(drone)\b/gi, `<span class="drone">$1🚁</span>`)
          .replace(/\b(horn)\b/gi, `<span class="horn">$1📯</span>`)
          .replace(/\b(viola)\b/gi, `<span class="viola">$1🎻</span>`)
          .replace(/\b(game)\b/gi, `<span class="game">$1🕹</span>`)
          .replace(/\b(money)\b/gi, `<span class="money">$1💵</span>`)
          .replace(/\b(skateboard|skateboarder)\b/gi, `<span class="skateboard">$1🛹</span>`)
          .replace(/\b(ricemilk)\b/gi, `<span class="ricemilk">$1🍚🥛</span>`)
          .replace(/\b(rice)\b/gi, `<span class="rice">$1🍚</span>`)
          .replace(/\b(milk)\b/gi, `<span class="milk">$1🥛</span>`)
          .replace(/\b(honey)\b/gi, `<span class="honey">$1🍯</span>`)
          .replace(/\b(car)\b/gi, `<span class="car">$1🏎</span>`)
          .replace(/\b(read|reads)\b/gi, `<span class="read">$1📖</span>`)
          .replace(/\b(garuda)\b/gi, `<span class="garuda">$1🦅</span>`)
          .replace(/\b(hanuman)\b/gi, `<span class="hanuman">$1🐒</span>`)
          .replace(/\b(agni)\b/gi, `<span class="agni">$1🔥</span>`)
          .replace(/\b(surya)\b/gi, `<span class="surya">$1😎</span>`)
          .replace(/\b(varuna)\b/gi, `<span class="varuna">$1⭐️</span>`)
          .replace(/\b(vayu)\b/gi, `<span class="vayu">$1💨</span>`)
          .replace(/\b(manyu)\b/gi, `<span class="manyu">$1🤑</span>`)
          .replace(/\b(yama)\b/gi, `<span class="yama">$1🦬</span>`)
          .replace(/\b(friend|friends|friendly|friendship)\b/gi, `<span class="friend">$1🤝</span>`)
          .replace(/\b(sacrifice|sacrificer|sacrifices)\b/gi, `<span class="sacrifice">$1👺</span>`)
          .replace(/(>)(while):/gi, `$1<i class="tag-while">$2</i>`)
          .replace(/(>)(develop):/gi, `$1<i class="tag-develop">$2</i>`)
          .replace(/(>)(learn):/gi, `$1<i class="tag-learn">$2</i>`)
          .replace(/(>)(observe):/gi, `$1<i class="tag-observe">$2</i>`);

}

class IndraInterface {
  constructor() {
    this.client = false;
    this.content = false;
    this.data = false;
    this.log = [];
  }

  _formatLog() {
    const _output = [];
    this.log.forEach(item => {
      _output.push(logHtml(item));
    });
    return _output.reverse().join('\n');
  };

  _insertLog(packet) {
    this.log.push(packet)
  }

  _keyValue(obj) {
    // create html key pair format
    const output = [];
    for (let key in obj) {
      if (typeof obj[key] === 'object') output.push(`<div class="child"><div class="key">${key}</div><div class="values">${this._keyValue(obj[key])}</div></div>`);
      else {
        let v = obj[key];
        if (Array.isArray(obj)) {
          obj.forEach(av => {
            output.push(`<div class="row"><div class="value">${av}</div></div>`);
          });
        }
        else {
          if (v.toString().startsWith('/')) v = `<button onclick="Indra.Mind('${v}', true)">${v}</button>`;
          output.push(`<div class="row"><div class="key">${key}:</div><div class="value">${v}</div></div>`)
        }
      };
    }
    return output.join('\n');
  }
  Question(q) {
    console.log('QUESTION INDRA');
    axios.post('/question', {
      text: q,
      created: Date.now(),
    }).then(answer => {
      console.log('ANSWER: ', answer.data)
      this._insertLog(packet);
      this.content = this._formatLog();
      this.Show('log');
    }).catch(console.error);
  }

  Log() {
    return Promise.resolve(this._formatLog());
  }

  Client() {
    return new Promise((resolve, reject) => {
      axios.get('/data/config/client.json').then(client => {
        this.client = client.data.data;
        this.content = `<div id="ClientData">${this._keyValue(this.client)}</div>`;
        this.Show('client');
        return resolve(true);
      }).catch(reject);
    })
  }

  Corpus() {
    return new Promise((resolve, reject) => {
      axios.get('/corpus').then(corpus => {
        this.content = `<div id="CorpusData">${formatFeecting(corpus.data)}</div>`;
        this.Show('corpus');
        return resolve(true);
      }).catch(reject);
    })
  }
  Zines() {
    return new Promise((resolve, reject) => {
      axios.get('/zines').then(zines => {
        this.content = `<div id="ZinesData">${formatFeecting(zines.data)}</div>`;
        this.Show('zines');
        return resolve(true);
      }).catch(reject);
    })
  }
  Docs(_path='/docs') {
    return new Promise((resolve, reject) => {
      axios.get(_path).then(docs => {
        this.content = `<div id="DocsData">${formatFeecting(docs.data)}</div>`;
        this.Show('docs');
        return resolve(true);
      }).catch(reject);
    })
  }
  Help(_path='/help') {
    return new Promise((resolve, reject) => {
      axios.get(_path).then(help => {
        this.content = `<div id="HelpData">${formatFeecting(help.data)}</div>`;
        this.Show('help');
        return resolve(true);
      }).catch(reject);
    })
  }
  Mind(path='/data/mind/index.json') {
    console.log('MIND');
    return new Promise((resolve, reject) => {
      axios.get(path).then(mind => {
        this.content = `<div id="MindData">${this._keyValue(mind.data)}</div>`;
        this.Show('mind');
        return resolve(true);
      }).catch(reject);
    })
  }
  State(path='/data/state') {
    return new Promise((resolve, reject) => {
      axios.get(path).then(state => {
        this.content = `<div id="StateData">${this._keyValue(state.data.files.map(f => `/data/state/${f}`))}</div>`;
        this.Show('state');
        return resolve(true);
      }).catch(reject);
    })
  }
  Lang() {
    return new Promise((resolve, reject) => {
      axios.get(`/data/lang/${this.client.profile.lang}.json`).then(lang => {
        this.content = `<div id="LangData">${this._keyValue(lang.data)}</div>`;
        this.Show('lang');
        return resolve(true);
      }).catch(reject);
    })
  }
  Mail() {
    return new Promise((resolve, reject) => {
      axios.get('/services/mail/inbox.json').then(mail => {
        // now we setup the inbox code here.
        this.content = `<div id="MailData">${inboxHtml(mail.data)}</div>`;
        this.Show('mail');
        return resolve(true);
      }).catch(reject);
    });
  }
  Show(area) {
    $('menu ul li button.active').removeClass('active');
    $('#content').html(this.content);
    $(`.${area}`).addClass('active');
    return Promise.resolve(true);
  }
  Security() {
    $('.SECURITY').toggleClass('ALERT');
  }
  Medical() {
    $('.MEDICAL').toggleClass('ALERT');
  }
  Snack(type='food') {
    const snacks = {
      fruit: [
        '🍒',
        '🍓',
        '🍇',
        '🍎',
        '🍉',
        '🍑',
        '🍊',
        '🍍',
        '🍌',
        '🥑',
        '🍏',
        '🍈',
        '🍐',
        '🥭',
        '🥥',
        '🫐',
      ],
      veggie: [
        '🥦',
        '🥒',
        '🥬',
        '🥕',
        '🌽',
        '🍠',
        '🥔',
        '🍅',
        '🍆',
        '🫑',
        '🌶',
        '🧄',
        '🧅',
      ],
      food: [
        '🥗',
        '🍟',
        '🍜',
        '🍝',
        '🍿',
        '🥞',
        '🧇',
        '🍫',
        '🍬',
        '🧀',
        '🥜',
        '🌰',
        '🥯',
        '🍞',
        '🥖',
        '🥐',
        '🥨',
        '🍘',
        '🍚',
        '🍙',
        '🥠',
        '🫒',
        '🥮',
        '🫓',
        '🍯',
      ],
      drink: ['🍵','🥛','🧃','🫖','🧋'],
    };
    const snack = Math.floor(Math.random() * snacks[type].length);
    $('.SNACKS').text(`${snacks[type][snack]}`);
    $('body').addClass('snack-time');
  }
  Init() {
    this.Client().then(() => {
      console.log('INDRA LOADED');
    }).catch(console.error);
  }
}
