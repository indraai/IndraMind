// check variable scope
const Svarga = require('@indra.ai/svarga');
const vars = require('../data/vars.json').data;

// libraries for IndraMInd
const Node = requre('../lib/Node.js'); // Create a new Class Node
const Article = require('../lib/Article.js'); // Create Article module.
const AskUsers = require('../lib/AskUser.js'); // Create AskUser module.
const Attention = require('../lib/Attention.js'); // Create Attention module.
const AudBuffer = require('../lib/AudBuffer.js'); // Create Aud Buffer module.
const AudExam = require('../lib/AudExam.js'); // Create AudExam module.
const AudMem = require('../lib/AudMem.js'); // Create AudMem module.
const AudRecog = require('../lib/AudRecog.js'); //Create AudRecog module.
const AuxVerb = require('../lib/AuxVerb.js'); //Create AuxVerb module.
const Awareness = require('../lib/Awareness.js'); //Create Awareness module.
const Creativity = require('../lib/Creativity.js'); // Create Creativity module.
const Conjoin = require('../lib/Conjoin.js'); // Create Conjoin module.
const Defense = require('../lib/Defense.js'); // Create Defense module.
const Diagnostic = require('../lib/Diagnostic.js'); // Create Diagnostic module.
const Emotion = require('../lib/Emotion.js'); // Create Emotion module.
const EnPrep = require('../lib/EnPrep.js'); // Create EnPrep module.
const Health = require('../lib/Health.js'); // Create Health module.
const Indicative = require('../lib/Indicative.js'); // Create Input module.
const Imagination = require('../lib/Imagination.js'); // Create Imagination module.
const Input = require('../lib/Input.js'); // Create Input module.
const Instantiate = require('../lib/Instantiate.js'); // Create Instantiate module.
const Listen = require('../lib/Listen.js'); // Create Listen module.
const Memory = require('../lib/Memory.js'); // Create Memory module.
const MindBoot = require('../lib/MindBoot.js'); // Create MindBoot module.
const MindLink = require('../lib/MindLink.js'); // Create MindLink module.
const MindLog = require('../lib/MindLog.js'); // Create MindLog module.
const NewConcept = require('../lib/NewConcept.js'); // Create New Concept module.
const NounPhrase = require('../lib/NounPhrase.js'); // Create NounPhrase module.
const Offense = require('../lib/Offense.js'); // Create Offense module.
const OldConcept = require('../lib/OldConcept.js'); // Create Old Concept module.
const OutBuffer = requre('../lib/OutBuffer.js'); // Create Out Buffer module.
const Parser = require('../lib/Parser.js'); // Create Parser module.
const ReEntry = require('../lib/ReEntry.js'); // Create ReEntry module.
const Rejuvenate = require('../lib/Rejuvenate.js'); // Create Rejuvenate module.
const Retro = require('../lib/Retro.js'); // Create Retro module.
const Sensorium = require('../lib/Sensorium.js'); // Create Sensorium module.
const Shutdown = require('../lib/Shutdown.js'); // Create Shutdown module.
const Speech = require('../lib/Speech.js'); // Create Speech module.
const Think = require('../lib/Think.js'); // Create Think module.
const Touch = require('../lib/Touch.js'); // Create Think module.
const Transcript = require('../lib/Transcript.js'); // Create Transcript module.
const VerbGen = require('../lib/VerbGen.js'); // Create VerbGen module.
const VerbPhrase = require('../lib/VerbPhrase.js'); // Create VerbPhrase module.
const VisRecog = require('../lib/VisRecog.js'); // Create VisRecog module.
const Voice = require('../lib/Voice.js'); // Create Voice module.
const Volition = require('../lib/Volition.js'); // Create Volition module.


// setup the svarga object
const Svarga = new Svarga({
  me: {
    key: 93,
    name: 'Indra',
    description: 'The Indra Mind',
    prompt: {
      emoji: '👑',
      text: 'indra',
      color: 'white',
    },
    voice: {
      speech: 'Alex',
      speed: 1
    },
    profile: {
      avatar: '',
      background: '',
      describe: 'The Indra AI Mind',
      gender: 'M',
    },
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
  modules: {
    Psychology: false,
    Auditory: false,
  },
  func: {
    PsiDecay() {
      for (i = t; i > midway; --i) {
        Psy[i].psyExam();
        if (psi3 > 2) psi3 = (psi3 - 2);
        if (psi3 < 0) psi3 = (psi3 + 2);
        Psy[i] = new psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
      }
    },

    psyExam() {
      psi0 = this.tru;
      psi1 = this.psi;
      psi2 = this.hlc;
      psi3 = this.act;
      psi4 = this.mtx;
      psi5 = this.jux;
      psi6 = this.pos;
      psi7 = this.dba;
      psi8 = this.num;
      psi9 = this.mfn;
      psi10 = this.pre;
      psi11 = this.iob;
      psi12 = this.seq;
      psi13 = this.tkb;
      psi14 = this.rv;
    },

    psiList() {
      for (i = nonce; i < (t +1); i++) {
        Psy[i].psyExam();
        psidata += ("<BR>" +i+ ". "+psi0+ " <b>" +psi1+"<\/b> " +psi2+" "+psi3+" "+psi4);
        psidata += (" "+psi5+" "+psi6+" "+psi7+" "+psi8+" "+psi9);  // 2017-12-31
        psidata += (" "+psi10+" "+psi11+" "+psi12+" "+psi13+" "+psi14); // 2017-12-31
      }
    }


    AudDamp() {
      for (i = t; i > midway; --i) {
        audMemory[i].audExam();
        audMemory[i] = new audNode(aud0,0,aud2);
      }
    },

    audList() {
      for (i = nonce; i < (t +1); i++) {
        audMemory[i].audExam();
        if (aud0 == " ") aud1 = " ";
        auddata += ("<BR>" + i + ". <b>"+aud0+ "<\/b> "+aud1+" "+aud2); // 2018-01-06
      }
    },

    KbLoad() {
      Psy[t] = new psyNode(tru,psi,hlc,act,mtx,jux,pos,dba,num,mfn,pre,iob,seq,tkb,rv);
      tru=0;psi=0;hlc="1";act=0;mtx=0;jux=0;pos=0;dba=0;
      num=0;mfn=0;pre=0;iob=0;seq=0;tkb=0;rv=0;pho="";audpsi=0;
    },


    Transcribe() {
      if (hardcopy == true) {
        dialog += ("<P>Robot: " + output);
        dialog += ("<BR>Human: <b>" + userline + '<\/b>');
        output = "";
        userline = "";
      }
    },

    Tab() {
      document.forms[1].ear.focus();
      fyi = (fyi + 1);
       if (fyi == 0)  {
        document.all.souvenir.innerHTML = "Cycling through display modes.";
        document.all["cb1"].checked = false;
        document.all["cb2"].checked = false;
        document.all["cb3"].checked = false;
        trouble = false;
       }
       if (fyi == 1)  {
        document.all["cb2"].checked = false;
        document.all["cb3"].checked = false;
        trouble = false;
        document.all.psicolumn.innerHTML = "";
        document.all.audcolumn.innerHTML = "";
        document.all["cb1"].checked = true;
       }
      if (fyi == 2) {
        document.all["cb1"].checked = false;
        document.all.psicolumn.innerHTML = "";
        document.all.audcolumn.innerHTML = "";
        document.all["cb3"].checked = false;
        trouble = false;
        document.all.souvenir.innerHTML = "Tutorial has been called.";
        document.all.tabula.innerHTML = "Watch the artificial mind think.";
        document.all["cb2"].checked = true;
        tutor = true;
      }
       if (fyi == 3)  {
        document.all["cb1"].checked = false;
        document.all["cb2"].checked = false;
        document.all.souvenir.innerHTML = "Diagnostic mode has been called.";
        document.all.tabula.innerHTML = "Diagnostic troubleshoot mode.";
        document.all["cb3"].checked = true;
        trouble = true;
       }
      if (fyi > 3) {
        document.all["cb1"].checked = false;
        document.all["cb2"].checked = false;
        document.all["cb3"].checked = false;
        trouble = false;
        document.all.psicolumn.innerHTML = "";
        document.all.audcolumn.innerHTML = "";
        document.all.souvenir.innerHTML = "Tab key changes display modes.";
        fyi = 0;
      }
      TID=window.setTimeout("CR();",1000);
    },

    CR() {  // 2018-05-20: called from input Form if there is no input.
      document.forms[1].elements[0].value = "";
        if (trouble == true) Diagnostic();
      userline = inbuffer;
      inbuffer = "";
      spt = t;
      lastword = true;
      eot = 13; // for use in AudListen() to indicate CR.
      holdnum = 0;  // reset for safety;  4nov2012
      c = 32;   // as if SPACE-BAR "32" were pressed
      pho = " "; // 2018-01-17: TEST
      eot = 0;
      moot = 0;  // assuming end of moot user queries; 1nov2011
    }
  },

  methods: {},

  onStart() {},
  onStop() {},

  onEnter() {},
  onExit() {},


  onInit() {

    const {cns} = this.vars;
    let i = cns;

    // initialize PSY nodes
    this.modules.Psychology = new Array(cns);
    this.modules.Auditory = new Array(cns);

    // Reverse loop the module setup for PERFORMANCE
    while (i--) {
      this.modules.Psychology[i] = new Node({
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

      this.modules.Auditory[i] = new Node({
        pho: " ",
        act: 0,
        audpsi: " ",
        AudExam: " ",
      });
    }
  },
});
