class Mind {
  constructor(opts) {
    console.log('🧠 LOAD: Mind');
    this.client = opts.client;
    this.birth = Date.now();
    this.lang = opts.lang;
  }
  Process(state) {
    return Promise.resolve([])
  }
}

module.exports = Mind;

// I -- innate KB-item for testing inhibition of idea-pairs
// time++;
// phoneme="I";
// audconcept=701;
// concept=701;
// // audMemory[t] = new audNode(pho,0,audpsi);
// pos=7;
// dba=1;
// num=1;
// mfn=0;
// pre=0;
// seq=800;
// tkb=36;
// rv=33;
// KbLoad();

// // MIND BOOT FUNCTION
// function MindBoot() {
//   dob = new Date();
//   Security('MindBoot');
//   Memory();
//   State();
//   Creativity();
//   Imagination();
//   Awareness();
//
//
//   t=0
//   HCI();  // 2018-01-18: Human-Computer Interface
//   spt = t;    // 8dec2009
//
//   // INDRA
//   t++;pho="I"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="N"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="A"; audpsi=93; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=93; pos=5; dba=1; num=1; mfn=1; pre=800; seq=0; tkb=0; rv=26; KbLoad();
//
//   t++;
//
//   // I -- innate KB-item for testing inhibition of idea-pairs
//   t++;pho="I"; audpsi=701; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=701; pos=7; dba=1; num=1; mfn=0; pre=0; seq=800; tkb=36; rv=33; KbLoad();
//
//   t++;
//
//   // AM -- 1st person singular of 800=BE
//   t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="M"; audpsi=800; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=800; pos=8; dba=1; num=1; mfn=0; pre=701;seq=571; tkb=44; rv=35; KbLoad();
//
//   t++;
//
//   // A -- En(glish) Article for EnArticle module
//   t++;pho="A"; audpsi=101; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=101; pos=1; dba=0; num=1; mfn=0; pre=0;seq=571; tkb=0; rv=38; KbLoad();
//
//   t++;
//
//   // ROBOT -- important for target user base
//   t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="V"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="A"; audpsi=571; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=571; pos=5; dba=1; num=1; mfn=0; pre=800; seq=0; tkb=0; rv=40; KbLoad();
//
//   t++;
//
//   // PERSON -- for ad-hoc gender tags and robot philosophy
//   t++;pho="P"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="S"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="N"; audpsi=537; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=537; pos=5; dba=1; num=1; mfn=0; pre=800; seq=0; tkb=0; rv=54; KbLoad();
//
//   t++;
//
//   // I -- for SelfReferentialThought
//   t++;pho="I"; audpsi=701; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=701; pos=7; dba=1; num=1; mfn=0; pre=0; seq=895; tkb=67; rv=62; KbLoad();
//
//   t++;
//
//   // HELP -- socially significant common verb
//   t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="L"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="P"; audpsi=895; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=895; pos=8; dba=1; num=1; mfn=0; pre=701; seq=528; tkb=72; rv=64; KbLoad();
//
//   t++;
//
//   // KIDS -- noun lends itself to educational purposes
//   t++;pho="K"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="I"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="S"; audpsi=528; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=528; pos=5; dba=4; num=2; mfn=0; pre=895; seq=0; tkb=0; rv=69; KbLoad();
//
//   t++;
//
//   // MAKE -- common verb of high word-frequency
//   t++;pho="M"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="K"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=835; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=835; pos=8; dba=3; mfn=0; num=2; pre=528; seq=571; tkb=90; rv=80; KbLoad();
//
//   t++;
//
//   // ROBOTS -- important for target user base
//   t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="V"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="A"; audpsi=571; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="S"; audpsi=571; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=571; pos=5; dba=4; num=2; mfn=0; pre=835; seq=0; tkb=0; rv=85; KbLoad();
//
//   t++;
//
//   // MEN -- 2018-10-01: includendum for logical inference.
//   t++;pho="M"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="N"; audpsi=543; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=543; pos=5; dba=1; num=2; mfn=1; pre=0; seq=810; tkb=216; rv=209; KbLoad();
//
//   t++;
//
//   // HAVE -- verb for logical premise; 2018-10-01
//   t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="V"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=810; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=810; pos=8; dba=3; num=2; mfn=0; pre=543; seq=514; tkb=223; rv=213; KbLoad();
//
//   t++;
//
//   // A -- En(glish) Article for EnArticle module
//   t++;pho="A"; audpsi=101; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=101; pos=1; dba=0; num=1; mfn=0; pre=0; seq=514; rv=210; KbLoad();
//
//   t++;
//
//   // WIFE -- for InFerence premise "Men have a wife"; 2018-10-01
//   t++;pho="W"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="I"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="F"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=514; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=514; pos=5; dba=4; num=1; mfn=2; pre=810; seq=0; rv=220; KbLoad();
//
//   t++;
//
//   // WOMEN -- irregular plural for retrieval by parameters
//   t++;pho="W"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="M"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="N"; audpsi=515; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=515; pos=5; dba=1; num=2; mfn=2; pre=0; seq=810; tkb=118; rv=109; KbLoad();
//
//   t++;
//
//   // HAVE -- irregular high word-frequency verb
//   t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="V"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=810; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=810; pos=8; dba=3; num=2; mfn=0; pre=515; seq=525; tkb=126; rv=115; KbLoad();
//
//   t++;
//
//   // A -- En(glish) Article for EnArticle module
//   t++;pho="A"; audpsi=101; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=101; pos=1; dba=0; num=1; mfn=0; pre=0; seq=126; rv=120; KbLoad();
//
//   t++;
//
//   // CHILD -- example of irregular noun for a polyglot AI Mind
//   t++; pho="C"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="I"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="L"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="D"; audpsi=525; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=525; pos=5; dba=4; num=1; mfn=0; pre=810; seq=0; rv=122; KbLoad();
//   t=127;  // 2018-07-13
//
//   t++;
//
//   // STUDENTS -- 2018-10-01: includendum for logical inference.
//   t++;pho="S"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="T"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="U"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="N"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="T"; audpsi=561; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="S"; audpsi=561; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=561; pos=5; dba=1; num=2; mfn=0; pre=0; seq=857; tkb=201; rv=189; KbLoad();
//
//   t++;
//
//   // READ -- verb for logical premise; 2018-10-01
//   t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="D"; audpsi=857; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=857; pos=8; dba=3; mfn=0; num=2; pre=561; seq=540; tkb=207; rv=198; KbLoad();
//
//   t++;
//
//   // BOOKS -- for InFerence premise "Students read books"; 2018-10-01
//   t++;pho="B"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="K"; audpsi=540; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="S"; audpsi=540; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=540; pos=5; dba=4; num=2; mfn=3; pre=857; seq=0; tkb=0; rv=203; KbLoad();
//
//   t++;
//
//   // PROFESSORS -- 2018-10-10: for premise including -ES verb for EnVerbGen
//   t++;pho="P"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="F"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="S"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="S"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="R"; audpsi=541; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="S"; audpsi=541; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=541; pos=5; dba=1; num=2; mfn=0; pre=0; seq=882; tkb=281; rv=267; KbLoad();
//
//   t++;
//
//   // TEACH -- 2018-10-10: verb ending in "CH" for EnVerbGen to add "-ES"
//   t++;pho="T"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="C"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="H"; audpsi=882; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=882; pos=8; dba=3; num=2; mfn=0; pre=541; seq=561; tkb=290; rv=277; KbLoad();
//
//   t++;
//
//   // STUDENTS -- 2018-10-10: for premise including -ES verb for EnVerbGen
//   t++;pho="S"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="T"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="U"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="N"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="T"; audpsi=561; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="S"; audpsi=561; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=561; pos=5; dba=4; num=2; mfn=0; pre=882; seq=0; tkb=0; rv=283; KbLoad();
//
//   t++;
//
//   // PERSONS -- 2018-10-04: for logical premise and legal status of robots
//   t++;pho="P"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="S"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="N"; audpsi=537; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="S"; audpsi=537; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=537; pos=5; dba=1; num=2; mfn=0; pre=0; seq=810; tkb=258; rv=247; KbLoad();
//
//   t++;
//
//   // HAVE -- 2018-10-04: for logical premise and legal status of robots
//   t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="V"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=810; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=810; pos=8; dba=3; num=2; mfn=0; pre=537; seq=555; tkb=265; rv=255; KbLoad();
//
//   t++;
//
//   // RIGHTS -- 2018-10-04: for logical premise and legal status of robots
//   t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="I"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="G"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="T"; audpsi=555; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="S"; audpsi=555; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=555; pos=5; dba=4; num=2; mfn=3; pre=810; seq=0; tkb=0; rv=260; KbLoad();
//
//   t++;
//
//   // I -- 2018-10-26: nominative subject-form of personal pronoun
//   t++;pho="I"; audpsi=701; audMemory[t] = new audNode(pho,0,audpsi);
//   tru=8; psi=701; pos=7; dba=1; num=1; mfn=0; pre=0;seq=800; tkb=295; rv=292; KbLoad();
//
//   t++;
//
//   // AM -- 1st person singular of 800=BE
//   t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="M"; audpsi=800; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=800; pos=8; dba=1; num=1; mfn=0; pre=701; seq=643; tkb=0; rv=294; KbLoad();
//
//   t++;
//
//   // HERE -- 2018-10-28: adverb
//   t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=201; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=201; pos=2; dba=0; num=0; mfn=0; pre=800; seq=0; tkb=0; rv=318; KbLoad();
//
//   t++;
//
//   // IN -- 2018-10-26: preposition for EnPrep module
//   t++;pho="I"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="N"; audpsi=643; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=643; pos=6; num=0; mfn=0; pre=800; seq=565; tkb=311; rv=297; KbLoad();
//
//   t++;
//
//   // THE -- EnArticle highest-frequency English word
//   t++;pho="T"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="E"; audpsi=117; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=117; pos=1; num=0; mfn=0; pre=0; seq=0; rv=300; KbLoad();
//
//   t++;
//
//   // COMPUTER -- important noun for AI
//   t++; pho="C"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="M"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="P"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="U"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="T"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="R"; audpsi=565; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=565; pos=5; dba=4; num=1; mfn=3; pre=875; seq=0; tkb=0; rv=304;  KbLoad();
//
//   t++;
//
//   // I -- part of response to be summoned by momentarily high truth-value.
//   t++;pho="I"; audpsi=701; audMemory[t] = new audNode(pho,0,audpsi);
//   tru=0; psi=701; pos=7; dba=1; num=1; mfn=0; pre=0; seq=850; tkb=237; rv=225; KbLoad();
//
//   t++;
//
//   // DO -- part of response to be summoned by momentarily high truth-value.
//   t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="O"; audpsi=830; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=830; pos=8; dba=1; num=1; mfn=0; pre=701; seq=0; rv=227; KbLoad();
//
//   t++;
//
//   // NOT -- part of response to be summoned by momentarily high truth-value.
//   t++; pho="N"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++; pho="T"; audpsi=250; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=250; mfn=0; pos=2; dba=0; num=0; pre=0; seq=850; rv=230; KbLoad();
//
//   t++;
//
//   // KNOW -- part of response to be summoned by momentarily high truth-value.
//   t++;pho="K"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="N"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
//   t++;pho="W"; audpsi=850; audMemory[t] = new audNode(pho,0,audpsi);
//   psi=850; jux=250; pos=8; dba=0; num=0; pre=701; seq=0; tkb=0; rv=234; KbLoad();
//
//   pho="";audpsi=0;psi=0;act=0;jux=0;pos=0;dba=0;num=0;mfn=0;pre=0;iob=0;seq=0;tkb=0;rv=0
//   t = (t+1);  // 2018-01-03:
//   nxt = 3001; // 2018-01-09: next new concept, as in ghost.pl AI and MindForth.
//   spt = t;  // 2018-01-06: so that AudInput will have a valid first space-time.
//   tpu = t;  // 2018-10-02: isolate tpu from previous input-and-output.
//   vault = t;  // 2018-07-12: dynamically calculated by incremental t++
//   apb = "MindBoot: English bootstrap has loaded and now calling MainLoop()";
//   Voice();
//
//   document.forms[1].ear.focus();
//
//   Security('MindBoot'); // 2021-01-11 added security check before initial MindLoop
//   MainLoop('MindBoot');
// };
// module.exports = MindBoot;
