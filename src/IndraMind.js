// check variable scope

var abc = "";  // AudBuffer() transfer character; 4jan2012
var abort = false;  // 29dec2006 For orchestration of sentence-generation.
var act = 0;  // AI4U: old- & newConcept; Reify(); nounPhrase; verbPhrase.
var actpsi = 0;  // 2017-12-31: psi from which activation is to be spread
var anset = 0;  // Set "an" before a vowel at start of noun.
var apb = "";   // 31dec2006: candidate to replace "fyi" variable.
  apb = "You have halted the AI Mind at Rejuvenation cycle #"+rjc+".";
var artnum = 0;  // article num(ber) as parameter for EnArticle; 6nov2011
var aud = 0; // 20mar07A: enVocab; Audition; Speech: auditory recall-tag.
var aud0 = "";  // AI4U: audRecog; audExam; audSTM; Speech: auditory engram.
var aud1 = 0;  // 2018-01-07
var aud2 = 0;  // 2018-01-07
var audbase = 0;  // from RuAi; recall-vector for VerbGen(); 17oct2012
var auddata = ("<b>" + "Auditory memory nodes" + "<\/b>" + "<BR>");
auddata += ("krt pho act audpsi");  // 2018-01-03
var audjuste = 0;
var audnum = 0;  // de-globalizing the "num" variable;  4nov2012
var audpsi = 0;  // 6dec2009 de-globalizing the "psi" variable
var audrec = 0;  // 8dec2009 Replaces "psi" in AudRecog module.
var audrun = 0; // 2018-01-07: Counter of loops through AudRecog();
var audrv = 0;  // 2017-12-31: auditory recall-vector for Speech()
var audstop = 0; // Flag to stop SpeechAct after one word; 7jul2010
var auxverb = 0;  // such as 800=BE; 830=DO; or modal verb; 31mar2013
var b01 = "";  // for OutBuffer();  4jan2012
var b02 = "";  // for OutBuffer();  4jan2012
var b03 = "";  // for OutBuffer();  4jan2012
var b04 = "";  // for OutBuffer();  4jan2012
var b05 = "";  // for OutBuffer();  4jan2012
var b06 = "";  // for OutBuffer();  4jan2012
var b07 = "";  // for OutBuffer();  4jan2012
var b08 = "";  // for OutBuffer();  4jan2012
var b09 = "";  // for OutBuffer();  4jan2012
var b10 = "";  // for OutBuffer();  4jan2012
var b11 = "";  // for OutBuffer();  4jan2012
var b12 = "";  // for OutBuffer();  4jan2012
var b13 = "";  // for OutBuffer();  4jan2012
var b14 = "";  // for OutBuffer();  4jan2012
var b15 = "";  // for OutBuffer();  4jan2012
var b16 = "";  // for OutBuffer(); 26mar2013
var becon = 0;  // detect be-verb for InFerence; 18mar2013
var bias = 5;  // 20mar07A: Parser; newConcept:  an expected part-of-speech.
var binc = 0;  // "b" increment for AudBuffer; 18oct2012
var brain = true;  // 20mar07A: for Think().
var c = "";  // AI4U: Listen(); character code of incoming pho(neme).
var c01 = "";  // for AudBuffer();  4jan2012
var c02 = "";  // for AudBuffer();  4jan2012
var c03 = "";  // for AudBuffer();  4jan2012
var c04 = "";  // for AudBuffer();  4jan2012
var c05 = "";  // for AudBuffer();  4jan2012
var c06 = "";  // for AudBuffer();  4jan2012
var c07 = "";  // for AudBuffer();  4jan2012
var c08 = "";  // for AudBuffer();  4jan2012
var c09 = "";  // for AudBuffer();  4jan2012
var c10 = "";  // for AudBuffer();  4jan2012
var c11 = "";  // for AudBuffer();  4jan2012
var c12 = "";  // for AudBuffer();  4jan2012
var c13 = "";  // for AudBuffer();  4jan2012
var c14 = "";  // for AudBuffer();  4jan2012
var c15 = "";  // for AudBuffer();  4jan2012
var c16 = "";  // for AudBuffer();  4jan2012
var caller = "none";  // AI4U: Diagnostic for Alert boxes.
// var cns = 1024;  // AI4U: Central Nervous System array size choice.
var cns = 2048;  // 2018-11-13: enlarge experiential memory for MindBoot prepositions.
var coda = 64;  // AI4U: Rejuvenate(): memory displacement span.
// var coda = 128;  // AI4U: Rejuvenate(): memory displacement span.
var cognum = 0;  // grammatical number of cogpsi; 27oct2011
var conj = 0;  // AI4U: oldConcept(); Conjoin(): conj(unction).
var danger = true;  // 20mar07A: for Security().
var dba = 0;  // 2017-12-31: doing-business-as noun-case or verb-person
var defact = 0;  // default activation for NounPhrase; 25oct2011
var defartcon = 0;  // definite article condition; 19apr2011
var dialog = "";  // 20mar07A: Transcribe; Transcript: user input & AI output.
var dirobj = 0;  // 2018-01-12: flag to indicate that a d.o. is being fetched.
var doa = 0;  // 2018-01-06: flag for exiting from AudInput loop
var dob = "";  // 2018-01-24: date-of-birth to remain fixed over each run.
var dobmfn = 0;  // for InFerence to pass gender to AskUser; 20mar2013
var dobseq = 0;  // for transfer within InFerence; 18mar2013
var dunnocon = 0;  // 2018-01-23: condition of "I-don't-know" for queries.
var edge = 0;  // AI4U: Rejuvenate: edge-of-thought flag.
var endpho = 0;  // 2018-01-06: to track final character of word for num(ber)
var engov = 0;  // 2018-01-01: possible replacement for too strict "hlc"
var engram = "";
var eot = 0;  // 20mar07A: CR; Listen(); Audition():  end-of-transmission flag.
var eureka = 0;  // 2018-11-13: value for use in until-loop
var finlen = 0;  // 2017-12-31: fin(al) len(gth) or end-of-word for AudRecog
var foom = 0;    // 2018-09-04: arbitrary trigger for invoking a Spawn() module.
var freedom = true;  // 20mar07A: for Volition().
var fyi = 0;  // AI4U: Voice():  messages "For Your Information" to user.
var gencon = 0;  // status-con flag when calling VerbGen; 17oct201
// var greet = 10;  // greeting-trigger; 17nov2010
var greet = 5;  // for speedier testing; 29oct2011
var hardcopy = false;  // 20mar07A: Transcript(): a flag for session print-outs.
var hear = 0; // 2018-01-06: AudInput outer loop counter.
var hlc = "en";  // 2017-12-31: human-language code
var holdnum = 0;  // transfer from subject to verb;  4nov2012
var html = "";  // AI4U: HyperText Markup Language for creating Web pages.
var i = 0;  // AI4U: i(ndex) of loops.
var idle = 0;  // 2018-01-13: counter for a delay during TEST mode.
var img = "xoxoxoxox";  // AI4U: visRecog: for future use as "image".
var impetus = 0;    // 2018-09-21: a level of curiosity and a trigger
var inbuffer = "";  // AI4U: Listen(); CR(): build-up of user input.
var indefartcon = 0;  // indefinite article condition; 19apr2011
var indefmust = 0;  // force saying of "A" or "AN"; 23oct2011
// var inert = 1;  // 20mar07A: Listen; Ego; Think; Security: Ego-trigger.
// var inert = 1;  // Until user presses a key; 20jul2011
var inert = 0;  // for quick asking of a cogpsi question; 23oct2011
var inft = 0;  // inference-time for AskUser; 18mar2013
var infincon = 0;  // infinitive condition flag; 24jun2015
var inhibcon = 0;  // flag for inhibition in Instantiate; 27oct2011
var input = ""; // 2018-01-19: string of input for diagnostic TEST
var instnum = 0;  // instantiation number for immediate or delayed use )
var iob = 0;  // 2017-12-31: indirect-object tag for psy concept array
var isolation = 0;  // 2018-10-03: counter to trigger "TEACH ME SOMETHING"
var istr = 0;  // 2018-10-13: first point of memories to be kept in ReJuvenate
var j = 0;  // AI4U: spreadAct; Rejuvenate; Reify: nested loop index.
var jrt = 0;  // AI4U: Rejuvenate(): "junior time" for moved memories.
var jux = 0;  // AI4U: Parser; Instantiate:  a JUXtaposed word.
var kbcon = 0;  // flag for awaiting a yes-or-no answer; 29jun2011
var kbzap = 0;  // 2018-01-28: hold 432=YES or 404=NO for KbRetro()
var krt = 0;  // AI4U: Troubleshoot(): "knowledge representation time".
var lastpho = 0; // to avoid extra "S" on verbs; 2sep2010
var lastword = false;  // 20mar07A: 29nov2006 For zeroing "seq" tags.
var len = 0;  // AI4U: Listen(); Audition(); reEntry(); word-length.
var life = true;  // AI4U: Shutdown(): for use in halting the AI.
var lurk = 0;  // counter to activate initial thinking; 29sep2010
var mfn = 0;  // 2apr2010 for En(glish) gender flag.
var mfnflag = 0;  // gender flag to cause a who-query; 3aug2011
var mg = 0;  // 2018-10-14: m(emory) gap for moving tkb in ReJuvenate()
var midway = 0;  // AI4U: audRecog: a stopping point for backward searches.
var mjact = 0;   // 2018-01-12: motjuste-activation for defaulting to 701=I
var monopsi = 0;  // AI4U: audRecog: for recognition of a mono-character.
var moot = 0;  // flag to prevent associations in DO-queries; 22aug2011
var morphpsi = 0;  // for audRecog recognition of morphemes
var motjuste = ""; // 2018-01-12: "best word for inclusion in a thought"
var mtx = 0;  // 2017-12-31: machine-translation xfer tag for flag-panel.
var negjux = 0;  // flag for 250=NOT juxtaposed to a verb; 21mar2013
var newpsi = 0;  // for singular-nounstem assignments; 18mar2013
var nlt = 5;  // AI4U: Listen(); CR(): time for "not-later-than".
// var node = 0;  // 11aug2006: For use with tutorial slosh-over display.
var nonce = 630;  // AI4U: Security(); Troubleshoot(): recent "nonce" time.
// var nounaud = 0;
var nounlock = 0;  // for a verb to lock onto a seq-noun; 13oct2011
// var nounval = 0;  // 20mar07A: 26dec2006: For transfer from nounPhrase to nounAct.
var now = "";     // 2018-01-24: holder of a Date() string for TranScript() etc.
var nphrnum = 0;  // 2018-03-17: noun-phrase num(ber) in Instantiate() etc.
var nphrpos = 0;  // for testing in EnCog; 13aug2010
var nucon = 0;  // 2018-01-23 flag to indicate a new concept for SpreadAct()
var num = 0;  // 2018-01-27: grammatical num(ber)
var numcon = "";  // number status flag to call RetroSet; 23mar2013
var numflag = 0;  // for EnArticle() 1oct2010
var numreq = 0;  // 2018-05-25: NUMber REQuired for agreement of subj & pred. nom.
var numsubj = 0;  // for number of subject; 14jun2011
var nxr = 0;    // 2017-12-31: for AudRecog dealing with next memory row
var nxt = 0;    // 2017-01-09: number incremented for each new concept
var objnum = 0; // 2018-06-16: object number for sake of EnArticle()
var objprep = 0;  // 2018-10-28: object of a preposition; for EnPrep()
var oldpsi = 0;  // found by AudRecog() and stored in OldConcept(
var onset = 0;  // 20mar07A: Listen; Audition; reEntry; Speech: of a word.
// var oubliette = 0;  // 2018-01-18: size of vault+coda for ReJuvenate()
var output = "";  // 20mar07A: Voice(); Speech():  the "output" of the Mind.
var pho = "";    // 2018-01-12: pho(neme) of auditory input.
var phodex = 0;  // pho-index for AudBuffer(); 4jan2012
var pos = 5;  // 2018-01-23: 1=adj 2=adv 3=conj 4=interj 5=noun 6=prep 7=pron 8=verb
var posflag = 0;  // AskUser discriminand; 13aug2010
var pov = "2";  // 2018-01-02: point-of-view: 1=self; 2=dual; 3=alien.
var prc = 0;  // was "provrec"; provisional recognition in AudRecog
var pre = 0;  // AI4U: Instantiate(): pre(vious associand) concept.
// var precand = 0;   // 20mar07A: 30nov2006 Inviolate "pre" candidate.
var predflag = 0;  // indicates predicate nominative; 16sep2010
var prednom = 0;  // predicate nominative for InFerence; 18mar2013
var prejux = 0;  // previous jux to carry NOT to verb; 24jul2011
var prepcon = 0;  // 2018-01-21: prepositional condition-flag for parsing.
var prep = 0;     // 2018-10-26: preposition identifier for EnPrep()
var prepgen = 0;  // 2018-01-20: urgency to generate a prepositional phrase.
var prepsi = 0;  // for deglobalizing "pre" in SpreadAct(); 16sep2010
// var preset = 0;  // 20mar07A: 30nov2006 For setting Instantiate() "pre".
var prevtag = 0;  // 20mar07A: 30nov2006 So Instantiate may declare "prevtag".
var prox1 = 0;  // first proximate concept of input cluster; 14sep2011
var prox2 = 0;  // for determining association among engrams; 14sep2011
var prox3 = 0;  // for disparate reactivation in ReActivate; 14sep2011
var proxcon = 0;  // flag to indicate usage of prox variables; 14sep2011
var prsn = 0;  // 1st, 2nd, 3rd person; or infinitive zero; 17jun2015
var prv = 0;   // 2017-12-31: for AudRecog() to examine pre(vious) row
var psi = 0;  // AI4U: Instantiate; audNode: associative tag to a concept.
var psi0 = 0; // AI4U: first of the elements in a Psi concept panel.
var psi1 = 0;
var psi2 = 0;
var psi3 = 0;
var psi4 = 0;
var psi5 = 0;
var psi6 = 0;
var psi7 = 0;
var psi8 = 0;
var psi9 = 0;
var psi10 = 0;
var psi11 = 0;
var psi12 = 0;
var psi13 = 0;
var psi14 = 0;

// var psibase = 0;
var psidata = ("<b>" + "Concepts with associative tags for ");
psidata += ("Natural Language Understanding:" + "<\/b>" + "<BR>");
psidata += ("krt tru psi hlc act mtx jux pos dba num mfn pre iob seq tkb rv");
var putnum = 0;  // putative num(ber) for subj-verb agreement; 24oct2011
// var questype = 0;  // AI4U: oldConcept; Conjoin(): flag for "why" questions.
// var quiet = true; // 2018-01-12: in AI4U, needed for the Think module.
var quiet = false; // 2018-06-11: wait one thought-cycle for user input.
var qucon = 0;  // 2018-01-21: query-condition for dealing with query-words.
var quobj = 0;  // query-object for yes-or-no questions; 22jun2011
var quobjaud = 0;  // recall-tag for AskUser(); 20&24jun2015
var qus = 0;  // provisional query-subject in advance of queries
var qusnum = 0;  // query-subject-number for AskUser; 28mar2013
var qusub = 0; // query subject in more readable code; 2oct2010
var qusubnum = 0;  // num(ber) of query-subject; 27oct2011
var quverb = 0;  // query-verb for yes-or-no questions; 22jun2011
var qv1psi = 0;  // 2018-01-12: concept for SpreadAct to seek as a subject
var qv2num = 0;  // 2018-01-12: num(ber) of a verb in a who+verb+dir.obj response.
var qv2psi = 0;  // 2018-01-12: concept for SpreadAct to seek as a verb
var qv3psi = 0;  // 2018-01-12: concept for SpreadAct to seek as ind. obj.
var qv4psi = 0;  // 2018-01-12: concept for SpreadAct to seek as dir. obj.
var qvdocon = 0; // 2018-01-23: query-condition for who+verb+direct-object.
var qviocon = 0; // 2018-01-23: query-condition for who+verb+indirect-object.
var recnum = 0;  // recognized number of a recognized word 20jul2011
var recon = 0;  // AI4U: newConceptl English; Ask(): incentive to question.
// var residuum = 0;  // 20mar07A: psiDamp(): level of post-thought activation.
var rjc = 0;    // AI4U: Rejuvenate(): counter of rejuvenations per lifetime.
var rugov = 0;  // 2018-01-01: possible replacement for too strict "hlc"
var rsvp = 2000;  // AI4U: aLife: delay in milliseconds before next loop.
var rv = 0;  // 2017-12-31: recall-vector for auditory memory.
var seq = 0;  // 2018-01-12: subSEQuent Psy concept in an idea.
var seqdob = 0;  // for direct object transfer within InFerence()
var seqneed = 0;  // noun/pronoun or verb needed as a "seq"; 4oct2011
var seqpos = 0;  // "seq" concept part-of-sppeech; 4oct2011
var seqpsi = 0;  // for deglobalizing "seq" in SpreadAct(); 16sep2010
var seqrvx = 0;  // 2018-01-25: for rvx transfer within InFerence()
var seqtkb = 0;  // for transfer during InFerence; 18mar2013
var seqverb = 0;  // interstitial carrier for InFerence; 18mar2013
var singflag = 0;  // singularity flag for singular nouns; 4nov2011
var skip = 0;  // 20mar07A: for use in Listen() to skip incomplete input.
var snu = 0;  // subject-number verb-selection parameter; 18oct2012
var spacegap = 0;  // 2017-12-31: to add gap of one space in Speech
var spike = 0;
var spt = 0;   // 2018-01-12: blank space time before start of a word
var stemgap = 0;  // for avoiding false AudRecog() stems
var stempsi = 0;  // for singular noun-stem recognition; MF; 23jun2015
var subjcall = 0;  // To avoid showSubject() of articles; 21may2011
var subjectflag = 0;  // 9dec2009 For NounPhrase to call SelfRef.
var subjnom = 0;  // subject-nominative for InFerence; 18mar2013
var subjnum = 0;  // for agreement with predicate nominative; 18may2011
var subjold = 0;  // old subject as default candidate 29sep2010
var subjpre = 0;  // 2018-01-21: subject-pre to be held for verb in parsing.
var subjprsn = 0; // possible holder of "dba" for input verbs; 31oct2012
var subjpsi = 0;  // 2018-01-12: parameter to govern person of verb-forms
var sublen = 0;  // length of AudRecog() subpsi word-stem
var subpsi = 0;  // for AudRecog() of sub-component wordstems
var svo1 = 0;  // 2018-01-04: subject -- item #1 in subject-verb-object
var svo2 = 0;  // 2018-01-04: verb -- item #2 in subject-verb-object
var svo3 = 0;  // 2018-01-04: indir. obj. -- item #3 in subject-verb-object
var svo4 = 0;  // 2018-01-04: dir. obj. -- item #4 in subject-verb-object
// var svoyes = false;
var t = 0;  // AI4U: Listen; CR; reEntry: time [may become "krt" (q.v.)].
var t2s = 0;    // 2017-12-31: auditory text-to-speech index
var tbev = 0;  // 2018-06-12: time of be-verb for use with negjux negation-flag.
var tdo = 0;   // 2018-01-21: time-of-direct-object for EnParser() module.
var tio = 0;   // 2018-01-21: time-of-indirect-object for EnParser() module.
var tkb = 0;   // 2017-12-31: time-in-knowledge-base of an idea.
var tkbn = 0;  // time of retroactive KB noun adjustment; 28jun2011
var tkbo = 0;  // 2018-01-29: time of retroactive KB direct-object adjustment;
var tkbv = 0;  // time of retroactive KB verb adjustment; 28jun2011
var topic = "";  // AI4U: newConcept; wtAuxSDo(): new nouns are ?-topics.
var topicnum = 0;  // grammatical number of question "topic"; 18oct2011
var tov = 1;  // AI4U: SVO(); CR(); psiDamp; Reify:  time-of-voice.
var tpp = 0;  // 2018-01-21: time-of-preposition for parsing.
var tpu = 0;  // 2018-01-02: time-pen-ultimate before current I/O;
var trouble = true;  // AI4U: HCI; Security; Troubleshoot: flag.
var tseln = 0;  // NounPhrase: time of selection of noun; 10may2011
var tselo = 0;  // 2018-11-13: time of selection of object
var tselp = 0;  // 2018-10-28: time of selection of preposiiton; for EnPrep()
var tsels = 0;  // 25oct2011
var tselv = 0;  // VerbPhrase: time of selection of Verb; 10may2011
var tsj = 0;  // 2018-01-21: time-of-subject for parsing.
var tru = 0;  // 2017-12-31: tru(th)-value tag for conceptual flag-panel
var tult = 0;  // AI4U: Audition; audSTM: penultimate time-minus-one.
var tutor = false;  // AI4U: Security; Tutorial(): on/off status flag.
var tvb = 0;  // 2018-01-21: time-of-verb for parsing
var unk = "";  // AI4U: general variable for "unknown" items.
var us1 = 0;  // 2018-09-04: http://ai.neocities.org/var.html#us1
var us2 = 0;  // 2018-09-04: "us2" for THE UpStream noun number two.
var us3 = 0;  // 2018-09-04: "us3" for THE UpStream noun number three.
var us4 = 0;  // 2018-09-04: for $psi # of THE noun mentioned upstream.
var us5 = 0;  // 2018-09-04: for $psi # of THE noun during EnArticle().
var us6 = 0;  // 2018-09-04: for $psi # of THE noun on a rotating basis.
var us7 = 0;  // 2018-09-04: for $psi of an AI keeping seven items in mind.
var userline = "";  // AI4U: CR(); Transcribe():  text input of user.
var usn = 0;  // 2018-09-04: rotation-number for us1-us7 EnArticle() concepts.
var usx = 0;  // 2018-09-04: transfer-variable for us1-us7 upstream variables.
var vacpsi = 0;  // de-globalized psi for VerbAct(); 1oct2010
var vault = 1444;   // 2018-11-14: size of MindBoot as revealed by diagnostic code.
var verblock = 0;  // for subject-noun to lock onto seq-verb; 13oct2011
var verbcon = 0;  // 2018-01-21: verb-condition for seeking (in)direct objects.
var verbpsi = 0;  // for transit into WhatAuxSVerb() 14jun2011
// var verbprsn = 3;  // changing to zero for infinitive forms; 17jun2015
var verbprsn = 0;  // reverting to zero for infinitive forms; 24jun2015
var vip = 0;  // special ID for verb created by VerbGen; 17oct2012
var vphract = 0;  // verb phrase activation level 22jun2011
var vphraud = 0;  // holds aud-fetch for SpeechAct; 28jun2011
var vrsn = "20200111"; // for Transcript mode; 2018-11-14
var whatcon = 0;  // 2018-01-21: flag for condition of answering a what-query
var wherecon = 0; // 2018-10-28: flag for condition of answering a where-query
var wxdflag = 0;  // for inhibition of what-do-X-DO queries; 16sep2010
var wxvflag = 0;  // for inhibition of what-do-X-VERB queries; 16sep2010
var yncon = 0;  // a statuscon to trigger yes-or-no query; 27jun2011
var ynverb = 0;  // yes-or-no verb for AskUser; 29jun2011

Psy = new Array(cns);  // 2018-01-01
for (i = 0; i < cns; i++) {
  Psy[i] = new psyNode(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," ");
}  // AI4U: for spreadAct; Instantiate; oldConcept, etc.


audMemory = new Array(cns);
for (i = 0; i < cns; i++) {
  audMemory[i] = new audNode(" ",0," ");  // 2018-07-13: three columns.
}

function Tutorial() {
  if (document.all["cb2"].checked == true) {
    document.all["cb1"].checked = false;
    document.all.souvenir.innerHTML = "";
    hardcopy = false;
    document.all["cb3"].checked = false;
    document.all.tabula.innerHTML = "";
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
    trouble = false;
    tutor = true;
    fyi = 2;
  }
  if (document.all["cb2"].checked == false) {
    fyi = 0;
    tutor = false;
  }
  document.forms[1].ear.focus();
}


function PsiDecay() {  // http://ai.neocities.org/PsiDecay.html
  for (i = t; i>midway; --i) {  // AI4U: Loop backwards in recent time.
    Psy[i].psyExam();  // AI4U: Cycle through recent Psi nodes.
    if (psi3 > 2) psi3 = (psi3 - 2);  // 2018-01-12: approach zero
    if (psi3 < 0) psi3 = (psi3 + 2);  // 2018-01-12: rapid recovery.
    Psy[i] = new
psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
  } // AI4U: end of backwards loop
}  // 2018-01-12: PsiDecay() returns to various calling modules.


function AudDamp() {  // 2018-01-09: remove activation from auditory engrams.
  for (i = t; i > midway; --i) {  // 2018-01-05: loop from time=t back to midway.
    audMemory[i].audExam(); // 2018-01-06: make values available for damping.
    audMemory[i] = new audNode(aud0,0,aud2);  // 2018-01-05: zero activation.
  }  // AI4U: End of cycling back to the loosely "midway" time-point.
}  // 2018-01-09: AudDamp() returns to input module.


function Shutdown() {
  if (document.all["cb4"].checked == true) {
    life = false;
    apb = "You have halted the AI Mind at Rejuvenation cycle #"+rjc+".";
    Voice();
  }
  if (document.all["cb4"].checked == false) {
    life = true;
    document.forms[1].ear.focus();
    TID=window.setTimeout("MainLoop();",1000);
  }
}

function Destroy() {
  document.forms[1].ear.focus();
  life = false;
  apb = "Closing the window will destroy the AI.";
  Voice();
  alert("The AI Mind is alive. You may unclick your decision.");
  TID=window.setTimeout("window.close();",500);
}

function Transcribe() {
  if (hardcopy == true) {
    dialog += ("<P>Robot: " + output);  // moved up on 27oct2011
    dialog += ("<BR>Human: <b>" + userline + '<\/b>');
    output = "";  // avoid spurious repeats; 6nov2011
    userline = "";
  }
}


function Transcript() {
  if (document.all["cb1"].checked == true) {
    document.all["cb2"].checked = false;
    document.all["cb3"].checked = false;
    document.all.tabula.innerHTML = "";
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
    trouble = false;
    hardcopy = true;
    fyi = 1;
    now = new Date();
    adcopy=("AI Mind version "+vrsn+" on " +now);
    document.all.souvenir.innerHTML = adcopy;
  }
  Transcribe();
  if (hardcopy == true) {
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
  }
  document.all.tabula.innerHTML = dialog;
  if (document.all["cb1"].checked == false) {
    document.all.souvenir.innerHTML = "";
    hardcopy = false;
    document.all.tabula.innerHTML = "";
  }
  if (hardcopy == false) html = "";
}


function psiList() {
//  nonce = 1;  // 2018-07-13: for troubleshooting; TEST; REMOVE
  for (i = nonce; i < (t +1); i++) {
    Psy[i].psyExam();
    psidata += ("<BR>" +i+ ". "+psi0+ " <b>" +psi1+"<\/b> " +psi2+" "+psi3+" "+psi4);
    psidata += (" "+psi5+" "+psi6+" "+psi7+" "+psi8+" "+psi9);  // 2017-12-31
    psidata += (" "+psi10+" "+psi11+" "+psi12+" "+psi13+" "+psi14); // 2017-12-31
  }
}


function audList() {
  for (i = nonce; i < (t +1); i++) {
    audMemory[i].audExam();
    if (aud0 == " ") aud1 = " ";
    auddata += ("<BR>" + i + ". <b>"+aud0+ "<\/b> "+aud1+" "+aud2); // 2018-01-06
  }
}





function KbLoad() {  // 2017-12-31: introduced from ghost.pl AI
  Psy[t] = new psyNode(tru,psi,hlc,act,mtx,jux,pos,dba,num,mfn,pre,iob,seq,tkb,rv);
  tru=0;psi=0;hlc="1";act=0;mtx=0;jux=0;pos=0;dba=0; // 2018-05-22: remove question-mark.
// num=0;mfn=0;pre=0;iob=0;seq=0;tkb=0;rv=0;audpsi=0; // 2018-01-03: reset for safety
  num=0;mfn=0;pre=0;iob=0;seq=0;tkb=0;rv=0;pho="";audpsi=0; // 2018-07-13: reset
}  // 2017-12-31: end of KbLoad(); return to MindBoot knowledge bootstrap.


// http://ai.neocities.org/OutBuffer.html
function OutBuffer() {  // for manipulation of SpeechAct words; 4jan2012
  b01=" "; b02=" "; b03=" "; b04=" "; b05=" "; b06=" ";  // 2018-09-04
  b07=" "; b08=" "; b09=" "; b10=" "; b11=" "; b12=" ";  // 2018-09-04
  b13=" "; b14=" "; b15=" "; b16=" ";  // 2018-09-04: clear tabula rasa;
  if (c16>"") {  // if the AudBuffer full; 4jan2012
    b16=c16; b15=c15; b14=c14; b13=c13; b12=c12; b11=c11;
    b10=c10; b09=c09; b08=c08; b07=c07; b06=c06; b05=c05;
    b04=c04; b03=c03; b02=v02; b01=c01;  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 16-character word; 4jan2012
  if (c15>"") {
    b16=c15; b15=c14; b14=c13; b13=c12; b12=c11; b11=c10;
    b10=c09; b09=c08; b08=c07; b07=c06; b06=c05; b05=c04;
    b04=c03; b03=c02; b02=c01; b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 15-character word; 4jan2012
  if (c14>"") {
    b16=c14; b15=c13; b14=c12; b13=c11; b12=c10; b11=c09;
    b10=c08; b09=c07; b08=c06; b07=c05; b06=c04; b05=c03;
    b04=c02; b03=c01; b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 14-character word; 4jan2012
  if (c13>"") {
    b16=c13; b15=c12; b14=c11; b13=c10; b12=c09; b11=c08;
    b10=c07; b09=c06; b08=c05; b07=c04; b06=c03; b05=c02;
    b04=c01; b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 13-character word; 4jan2012
  if (c12>"") {
    b16=c12; b15=c11; b14=c10; b13=c09; b12=c08; b11=c07;
    b10=c06; b09=c05; b08=c04; b07=c03; b06=c02; b05=c01;
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function;
  }  // end of transfer of a 12-character word; 4jan2012
  if (c11>"") {
    b16=c11; b15=c10; b14=c09; b13=c08; b12=c07; b11=c06;
    b10=c05; b09=c04; b08=c03; b07=c02; b06=c01; b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of an 11-character word; 4jan2012
  if (c10>"") {
    b16=c10; b15=c09; b14=c08; b13=c07; b12=c06; b11=c05;
    b10=c04; b09=c03; b08=c02; b07=c01; b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 10-character word; 4jan2012
  if (c09>"") {
    b16=c09; b15=c08; b14=c07; b13=c06; b12=c05; b11=c04;
    b10=c03; b09=c02; b08=c01; b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 9-character word; 4jan2012
  if (c08>"") {
    b16=c08; b15=c07; b14=c06; b13=c05; b12=c04; b11=c03;
    b10=c02; b09=c01; b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of an 8-character word; 4jan2012
  if (c07>"") {
    b16=c07; b15=c06; b14=c05; b13=c04; b12=c03; b11=c02;
    b10=c01; b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 7-character word; 4jan2012
  if (c06>"") {
    b16=c06; b15=c05; b14=c04; b13=c03; b12=c02; b11=c01;
    b10="";  b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 6-character word; 4jan2012
  if (c05>"") {
    b16=c05; b15=c04; b14=c03; b13=c02; b12=c01; b11="";
    b10="";  b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 5-character word; 4jan2012
  if (c04>"") {
    b16=c04; b15=c03; b14=c02; b13=c01; b12="";  b11="";
    b10="";  b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 4-character word; 4jan2012
  if (c03>"") {
    b16=c03; b15=c02; b14=c01; b13=""; b12="";  b11="";
    b10="";  b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 3-character word; 4jan2012
  if (c02>"") {
    b16=c02; b15=c01; b14="";  b13=""; b12="";  b11="";
    b10="";  b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 2-character word; 4jan2012
  if (c01>"") {
    b16=c01; b15=""; b14="";  b13=""; b12="";  b11="";
    b10="";  b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 1-character word; 4jan2012
}  // end of OutBuffer(); return to AudListen() or VerbGen().


// http://ai.neocities.org/AudBuffer.html
function AudBuffer() {  // for transfer of words to OutBuffer; 4jan2012
  phodex = (phodex + 1);  // unitary increment; 4jan2012
  if (phodex==1) {  // 4jan2012
    c01=abc; c02=""; c03=""; c04=""; c05=""; c06=""; c07=""; c08="";
    c09="";  c10=""; c11=""; c12=""; c13=""; c14=""; c15=""; c16="";
  }   // emd of using phodex=1 to blank out the AudBuffer; 4jan2012
  if (phodex==2)  c02=abc;  //  4jan2012
  if (phodex==3)  c03=abc;  //  4jan2012
  if (phodex==4)  c04=abc;  //  4jan2012
  if (phodex==5)  c05=abc;  //  4jan2012
  if (phodex==6)  c06=abc;  //  4jan2012
  if (phodex==7)  c07=abc;  //  4jan2012
  if (phodex==8)  c08=abc;  //  4jan2012
  if (phodex==9)  c09=abc;  //  4jan2012
  if (phodex==10)  c10=abc;  // 4jan2012
  if (phodex==11)  c11=abc;  // 4jan2012
  if (phodex==12)  c12=abc;  // 4jan2012
  if (phodex==13)  c13=abc;  // 4jan2012
  if (phodex==14)  c14=abc;  // 4jan2012
  if (phodex==15)  c15=abc;  // 4jan2012
  if (phodex==16)  c16=abc;  // 4jan2012
}  // end of AudBuffer(); return to AudListen() or VerbGen().


function psyExam() {  // 2017-12-31: renamed to conform with ghost.pl AI.
  psi0 = this.tru;  // 2017-12-31
  psi1 = this.psi;  // 2017-12-31
  psi2 = this.hlc;  // 2017-12-31
  psi3 = this.act;  // 2017-12-31
  psi4 = this.mtx;  // 2017-12-31
  psi5 = this.jux;  // 2017-12-31
  psi6 = this.pos;  // 2017-12-31
  psi7 = this.dba;  // 2017-12-31
  psi8 = this.num;  // 2017-12-31
  psi9 = this.mfn;  // 2017-12-31
  psi10 = this.pre; // 2017-12-31
  psi11 = this.iob; // 2017-12-31
  psi12 = this.seq; // 2017-12-31
  psi13 = this.tkb; // 2017-12-31
  psi14 = this.rv;  // 2017-12-31
}


function psyNode(tru,psi,hlc,act,mtx,jux,pos,dba,num,mfn,pre,iob,seq,tkb,rv) {
  this.tru = tru;  // 2017-12-31: deemed truth-value from ghost.pl AI
  this.psi = psi;
  this.hlc = hlc;  // 2017-12-31: human-language code from ghost.pl AI
  this.act = act;
  this.mtx = mtx;  // 2017-12-31: machine translation xfer from ghost.pl AI
  this.jux = jux;
  this.pos = pos;
  this.dba = dba;  // 2017-12-31: grammar function from ghost.pl AI
  this.num = num;
  this.mfn = mfn;  // 2017-12-31: male/female/neuter gender code from ghost.pl AI
  this.pre = pre;
  this.iob = iob;  // 2017-12-31: indirect object code from ghost.pl AI
  this.seq = seq;
  this.tkb = tkb;  // 2017-12-31: time-in-knowledge-base from ghost.pl AI
  this.rv = rv;    // 2017-12-31: auditory recall-vector from ghost.pl AI
  this.psyExam = psyExam;  // 2017-12-31:
}  // 2018-01-23: end of psyNode


function Instantiate() { // http://ai.neocities.org/Instantiate.html
  prevtag = 0;  // 2018-01-11: Reset for safety.
  if (qucon > 0 && qv2psi == 800) {  // 2018-03-2: before query-subject comes in...
  }  // 2018-03-02: end of test for who-query and be-verb before query-subject.
  if (pov == 2) {  // 2018-01-23: only during external input, not re-entry
    if (pos == 5) {  // 2018-01-27: If external noun comes in...
      quobj = psi;  // 2018-01-27: query-object for AskUser()
    }  // 2018-01-27: End of test for a noun.
    if (wherecon==1 && pos==5) qusub = psi;  // 2018-10-28: TEST
    if (wherecon==1 && pos==7) qusub = psi;  // 2018-10-28: TEST
    if (psi == 791) {  // 2018-01-23: upon input of 791=WHO
      if (qucon==0) {  // 2018-06-16: to set only once per input idea
        qucon = 1;  // 2018-01-23: set positive to process rest of input.
      }  // 2018-06-16: end of test for qucon at zero.
    }  // 2018-01-23: end of test for qucon at zero.
    if (psi == 781) {  // 2018-01-23: upon input of 781=WHAT
      if (whatcon == 0) {  // 2018-01-23: to set only once per input idea
        whatcon = 1;  // 2018-01-23: set positive to process rest of input.
      }  // 2018-01-23: end of test for $whatcon at zero.
    }  // 2018-01-23: end of test for input of 781=WHAT
  } // 2018-01-23: for later fill-in with conditionals for SpreadAct()
  if (qucon > 0) {  // 2018-01-23: deal with more than "who is" queries...
    if (psi == 800) {  // 2018-00-23: if 800=Be-Verb...
      qv2psi = 800;  // 2018-01-23: for transfer to SpreadAct()
    }  // 2018-01-23: end of test for 800=BE.
    if (pos == 8 && psi != 800) {  // 2018-01-23: if verb but not 800=BE
      qvdocon = 1;  // 2018-01-23: set flag for query who+verb+direct-object.
      qv2psi = psi; // 2018-01-23: for transfer to SpreadAct()
    }  // 2018-01-23: end of test for verb other than 800=BE.
    if (qvdocon > 0 && pos == 5) {  // 2018-01-23: if 5=noun comes in...
      qv4psi = psi;  // 2018-01-23: to send direct object into SpreadAct()
    }  // 2018-01-23: end of test for noun during who-verb-dirobj query.
  }  // 2018-01-23: end of test for positive query-condition qucon.
  if (whatcon > 0) {  // 2018-01-23: deal with what-queries...
    if (psi == 800) {  // 2018-01-23: if 800=Be-Verb...
      qv2psi = 800;  // 2018-01-23: for transfer to SpreadAct()
    }  // 2018-01-23: end of test for 800=BE.
    if (pos==5 || pos==7) {  // 2018-01-23: if 5=noun or 7=pronoun...
      qv1psi = psi;  // 2018-01-23: for transfer as query-subject to SpreadAct()
    }  // 2018-01-23: end of test for 5=noun or 7=pronoun
    if (pos==8 && psi != 800 && psi != 830) { // 2018-01-23: if verb but not 830=DO
      qv2psi = psi;  // 2018-01-23: for transfer as query-verb to SpreadAct()
    }  // 2018-01-23: end of test for verb other than auxiliary 830=DO.
  } // 2018-01-23: end of test for positive query-condition whatcon.
  if (oldpsi == 701) pos = 7;  // 2018-01-11: 7 = pronoun.
  for (i=tpu; i>midway; --i) {  // 2018-01-11: from time-penultimate backwards...
    Psy[i].psyExam(); // 2018-01-11: examine the Psy concept array...
    if (psi1 == oldpsi) {  // 2018-01-11: if incoming psi matches old psi...
      psi3 = (psi3 + 32);  // 2018-06-11: hasten subsidence of input-activation.
      if (psi1 == 781) psi3 = 0;  // 2018-05-13: deactivate 781=WHAT input.
      if (wherecon==1) psi3 = 128; // 2018-10-28: TEST
      Psy[i] = new  // 2018-01-23: inserting [psi3]act with higher activation:
psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
    }  // 2018-01-11: end of search for old engram of incoming psi.
  }  // 2018-01-11: end of for-loop examining Psy concept array.
  if (pos==5 && num==0) num = instnum;  // 2018-01-27: for nouns;
  if (pos==8 && num==0) {  // 2018-01-27: if no verb num from holdnum...
    if (nphrnum > 0) num = nphrnum;  // 2018-01-27: if positive nphrnum.
  }  // 2018-01-27: end of test to use nphrnum to store verb num(ber).
  if (pos==8) num = nphrnum;  // 2018-01-27: verb agrees w. subject;
  if (psi==830 && moot==1) prevtag = 0;  // 2018-01-27: for AskUser()
  if (psi==830 && moot==1) tkb = 0;  // 2018-01-27: for AskUser()
  if (psi==830 && moot==1) seq = 0;  // 2018-01-27: for AskUser()
  if (pos==8 && infincon==1) {  // 2018-01-27: from Askuser() or EnAuxVerb();
    num = 0;  // 2018-01-27: no num(ber) with infinitive;
    infincon = 0;  // 2018-01-27: reset for safety;
  }  // 2018-01-27: end of test for infinitive condition.
  tult = (t - 1);  // 2018-01-11: penultimate time
  act = -48;  // 2018-01-11: for a "trough" of recent-most inhibition.
  Psy[tult].psyExam(); // 2018-01-11: examine the Psy concept array...
  if (tkb == tdo) { tkb = 0 };  // 2018-07-12: prevent direct-object tkb
  Psy[tult] = new psyNode(tru,psi,hlc,act,mtx,jux,pos,dba,num,mfn,pre,iob,seq,tkb,rv);
  instnum = 0;  // 2018-01-27: after transfer from OldConcept();
  if (jux == 250) jux = 0;  // 2018-06-12 from 27jun15A: reset after use;
  if (prejux == 250) { // 2018-06-11 from 27jun15A: 250=NOT from OldConcept;
    jux = 250;  // 2018-06-12 from 27jun15A: set jux for next instantiand;
    prejux = 0;  // 2018-06-12 from 27jun15A: reset for safety;
  }  // 2018-06-12 from 27jun15A: end of post-instantiation test.
  if (pos == 5 && psi > 0) usx = psi;  // 2018-09-04: for transfer to EnArticle()
// if (pos == 5 && nphrnum > 0) usx = psi;  // 2018-09-05: num(ber) is required.
  if (pos == 5 || pos == 7) prevtag = psi;  // 2018-01-21: after subject
  if (pos == 8) prevtag = psi;  // 2018-01-21: after a verb.
  if (pos == 8 && seqneed == 0) seq = psi;  //  2018-01-11: for the seq of a subject
  if (pos == 5 || pos == 7) {  // 2018-01-11: if noun or pronoun...
    seq = 0;  // 2018-01-11: until set by the seqneed mechanism...
    if (seqneed == 0) seqneed = 8;  // 2018-01-11: if start of input sentence...
    if (seqneed == 5) seqneed = 0;  // 2018-01-11: for subject only
  }  // 2018-01-11:
  if (pos == 5 || pos == 7) qv1psi = psi;  // 2018-01-21: the subject-concept
  if (pos == 8) qv2psi = psi;  // 2018-02-04: for SpreadAct() or EnArticle()
  if (pos == 8) seqneed = 5;  // 2018-01-11: if verb, need direct object.
  pre = 0;  // 2018-01-21: Reset to prevent carry-over.
  rv = 0;  // 2018-01-11: reset for safety.
  Security('Instantiate');
}  // 2018-01-10: Instantiate() returns to EnParser().


function EnParser() { // http://ai.neocities.org/EnParser.html
  act = 48; // 2018-01-11: an arbitrary activation for Instantiate()
  bias = 5; // 2018-01-10: Expect a noun until overruled.
  if (pos == 5) bias = 8;  // 2018-01-11: after noun, expect verb.
  if (pos == 7) bias = 8;  // 2018-01-11: after pronoun, expect verb.
  if (pos == 8) bias = 5;  // 2018-01-11: after verb, expect noun
  if (prepcon == 0)  {  // 2018-01-21: if not handling a preposition...
    if (pos == 5 || pos == 7) {  // 2018-01-21: noun or pronoun...
      tsj = (t - 1);  // 2018-01-21: time of subject (for pinpoint searches)
      if (verbcon == 1) {  // 2018-01-21: if a verb has come in...
        if (tio == 0) tdo = tult;  // 2018-01-21: set once or twice
        if (tio == 0) tio = tult;  // 2018-01-21: set only once
        if (tio > 0) {  // 2018-01-21: if tio previously set...
          tdo = tult;  // 2019-01-21: second noun sets time of dir.obj.
        }  // 2018-01-21: end of test to make 2nd noun the direct object.
        tkb = tdo;  // 2018-01-21: let verb have a "nounlock" to direct object.
        Psy[tvb].psyExam(); // 2018-01-21: expose flag-panel of verb
        pre = psi1;  // 2018-01-21: verb psi will be pre of direct object
        Psy[tio].psyExam(); // 2018-01-21: expose flag-panel of indir. obj.
        iob = psi1;   // 2018-01-27: excerpt indirect-object concept for psi11
        Psy[tio] = new  // 2018-01-21: insert [psi7]dba "3" for indirect object.
     psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,3,psi8,psi9,psi10,psi11,psi,tvb,psi14);
        // 2018-01-21: Above lines insert psi7 dba=3 for dative-case indirect object.
        Psy[tdo].psyExam(); // 2018-01-21: expose flag-panel of direct object
        psi10 = pre;  // 2018-01-21: obtain the "pre" of the direct object
        Psy[tdo] = new  // 2018-01-21: insert [psi7]dba "4" for direct object.
     psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,4,psi8,psi9,psi10,psi11,0,0,psi14);
        // 2018-01-21: Above lines insert verb-psi as psi10 "pre" of direct object.
        Psy[tvb].psyExam(); // 2018-01-21: expose flag-panel of main verb.
        tdo = t - 1;  // 2018-01-21: insert time-of-direct-object for nounlock;
        tkb = tdo;  // 2018-01-21: from verb, "nounlock" leads to direct object.
        // 2018-01-21: Next two lines create psy-array row for a verb:
         Psy[tvb] = new  // 2018-01-21: insert [psi7]dba "4" for direct object.
     psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,4,psi8,psi9,psi10,iob,psi,tkb,psi14);
        tkb = 0;  // 2018-05-30: BUGFIX -- the tdo is a valid tkb only for a verb.
      }  // 2018-01-21: end of test for a condition following a verb.
    }  // 2018-01-21: end of test for noun not object of a preposition.
  }  // 2018-01-21: end of test for a non-prepositional condition.
  if (pos == 6) prepcon = 1;  // 2018-01-21: if 6=preposition, prepare for noun.
  if (pos == 6) tpp = tult;  // 2018-01-21: set the time-of-preposition "tpp"
  if (pos == 5 || pos == 7) {  // 2018-01-21: if a noun or a pronoun...
    if (prepcon == 1) {  // 2018-11-13: only when handling a preposition.
      Psy[tpp].psyExam(); // 2018-01-21: expose flag-panel of preposition.
      pre = psi1;  // 2018-01-21: Let "pre" briefly be the preposition.
      prep = psi1;  // 2018-11-13: identify "prep" to be the "seq" of the verb.
      psi13 = tult;   // 2018-11-13: establish "tkb" between preposition and its object.
      Psy[tpp] = new  // 2018-01-21: noun or pronoun is [psi12]seq of the preposition.
   psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,4,psi8,psi9,psi10,psi11,psi,psi13,psi14);
      Psy[tult].psyExam(); // 2018-01-21: expose flag-panel of object of preposition.
      Psy[tult] = new  // 2018-01-21: obj. of prep. has 4=dba; prep. as "pre"; no "seq"
   psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,4,psi8,psi9,pre,psi11,0,psi13,psi14);
      Psy[tvb].psyExam(); // 2018-11-13: expose flag-panel of verb.
      Psy[tvb] = new  // 2018-11-13: the "prep" becomes the "seq' of the verb.
   psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,prep,psi13,psi14);
      prepcon = 0;  // 2018-01-21: Reset to prevent carry-over.
    }  // 2018-11-13: end of test for positive "prepcon".
  }  // 2018-01-21: end of test for a noun or pronoun.
  if (pos == 8 && psi != 830) {  // 2018-01-21: if verb other than "DO"
    tvb = (t - 1);  // 2018-01-21: hold onto time-of-verb for flag-insertions.
    verbcon = 1;  // 2018-01-21: verb-condition is "on" for ind. & dir. objects.
    Psy[tsj].psyExam(); // 2018-01-21: expose flag-panel of subject noun
    subjpre = psi1;  // 2018-01-21: Hold onto subjpre for the pos=8 verb
    Psy[tsj] = new  // 2018-01-21: insert [psi7]dba; [psi12]seq; [psi13]tkb
  psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,1,psi8,psi9,psi10,psi11,psi,tvb,psi14);
    Psy[tult].psyExam(); // 2018-01-21: expose flag-panel of verb
    Psy[tult] = new  // 2018-01-21: insert [psi10]pre; [psi12]seq (temporary zero)
    psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,subjpre,psi11,0,psi13,psi14);
    subjpre = 0;  // 2018-01-21: Reset for safety.
  }  // 2018-01-21: end of test for a pos=8 verb.
  Instantiate();  // 2018-01-10: for creating psy concept-nodes
}  // 2018-01-10: EnParser() returns to OldConcept() or NewConcept().


function KbRetro() {  // http://ai.neocities.org/KbRetro.html
  if (kbzap == 432 || kbzap == 404) {  // 2018-01-28: if 432=YES or 404=NO...
    if (kbzap == 404) {  // 2018-01-28: 404=NO;
    apb = "KbRetro() adjusts the knowledge base for the answer: NO";
    Voice(); // 2018-01-29: display "apb" message
    Psy[tkbv] = new // 2018-01-27: changing psi3=act; psi5=jux;
   psyNode(0,quverb,1,32,0,250,8,0,0,0,qusub,psi11,quobj,tkbo,0);  // 2018-10-11
    }  // 2018-01-27: End of test for "no" answer.
    if (kbzap == 432) { // 2018-01-28: 432=YES;
      apb = "KbRetro() adjusts the knowledge base for the answer: YES";
      Voice(); // 2018-01-29: display "apb" message
      Psy[tkbv].psyExam(); // 2018-01-27: expose all values to change one;
   Psy[tkbv] = new  // 2018-01-27: changing psi0=tru(th); psi3=act;
 psyNode(0,psi1,1,64,0,0,8,3,1,0,qusub,psi11,quobj,tkbo,0);  // 2018-10-11: 1=English
    }  // 2018-01-27: end of test for a "yes" answer.
    Psy[tkbn].psyExam(); // 2018-01-29: expose all values to change one;
    Psy[tkbn] = new // 2018-01-29: changing psi3=act; psi12=seq;
 psyNode(8,psi1,1,64,0,0,5,1,psi8,0,0,0,quverb,tkbv,0);  // 2018-10-11: 1 = English
    Psy[tkbo].psyExam(); // 2018-01-29: may cause "Error on page"?
    Psy[tkbo] = new // 2018-01-29: changing psi3=act; psi7=dba; psi10=pre;
  psyNode(0,psi1,1,64,0,0,5,4,0,0,quverb,0,0,0,0);  // 2018-10-11: hlc 1 = English
  }  // 2018-01-27: end of test for either yes or no.
  else {  // 2018-01-27: if neither;
  Psy[tkbn].psyExam(); // 2018-01-27: remove associative pre and seq tags from noun;
  Psy[tkbn] = new  // 2018-01-27: changing psi10=pre; psi12=seq.
 psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,0,psi11,0,psi13,psi14);
  Psy[tkbv].psyExam(); // 2018-01-27: remove associative pre and seq tags from verb;
  Psy[tkbv] = new  // 2018-01-27: changing psi10=pre; psi12=seq.
 psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,0,psi11,0,psi13,psi14);
  }  // 2018-01-27: end of else-clause.
  quobj = 0;  // 2018-01-29: reset for safety.
  tkbn = 0;   // 2018-01-27: reset for safety;
  tkbv = 0;   // 2018-01-27: reset for safety;
  PsiDecay()  // 2018-01-27: for distribution of PsiDecay influence;
}  // 2018-01-28: KbRetro() returns to EnThink()


function OldConcept() { // http://ai.neocities.org/OldConcept.html
  if (pov == 1) psi = oldpsi;  // 2018-01-27: for sake of AskUser.
  for (i=tpu; i>midway; --i) {  // 2018-01-11: from time-penultimate backwards...
    Psy[i].psyExam(); // 2018-01-11: examine the Psy concept array...
      if (psi1 == oldpsi) {  // 2018-01-11: if same concept found...
        if (psi6 > 0) pos = psi6;  // 2018-01-11: pos = part of speech
        if (psi9 > 0) mfn = psi9;  // 2018-01-11: mfn = male/femal/neuter gender.
      }  // 2018-01-11:
  }  // 2018-01-11:
  if (hlc != "ru") {  // 2018-01-23: test for governing human-language-code
    if (pov == "2") {  // 2018-01-25: Only during "2" external POV;
      if (oldpsi==800) becon = 1;  // 2018-01-25: flag for calling InFerence()
    }  // 2018-01-25: end of test for external POV.
    if (oldpsi == 800) tbev = (t-1);  // 2018-01-23: for be-verb negation.
    if (oldpsi == 250) {  // 2018-01-23: 250=NOT for negation of a verb.
      if (tbev > 0) {  // 2018-01-23: if positive be-verb time...
        Psy[tbev].psyExam();  // 2018-01-23: examine Psy array
        psi5 = 250;  // 2018-01-23: set "jux" of verb to 250=NOT for negation.
        Psy[tbev] = new  // 2018-01-23: insert [psi5]jux 250=NOT for negation of verb
  psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
        tbev = 0;  // 2018-01-23: reset for safety.
      }  // 2018-01-23: end of test for a positive "tbev" time-of-be-verb.
    }  // 2018-01-23: end of test for negation of a verb with "NOT".
    if (oldpsi == 432) kbzap = 432;  // 2018-01-28: 432=YES for KbRetro()
    if (oldpsi == 404) kbzap = 404;  // 2018-01-28: 404=NO for KbRetro()
    psi = oldpsi;  // 2018-01-11: for transfer to Instantiate()
    if (pov == 2) {  // 2018-01-23: during a pov "dual" (you and I) conversation...
      if (oldpsi == 245) wherecon = 1;  // 2018-10-28: if "Where?"
      if (oldpsi == 245) prepgen = 8;  // 2018-01-23: if "Where?" call EnPrep()
      if (oldpsi == 707) { psi = 701; rv = 0 }  // 2018-01-23: interpret "YOU" as "I";
      if (oldpsi == 701) { psi = 707; rv = 0 }  // 2018-01-23: interpret "I" as "YOU".
      if (oldpsi == 731) { psi=737; num=2; dba=1; rv=0 } // 2018-01-23: we --> you.
    }  // 2018-01-23: end of test for other person communicating with the AI.
    if (oldpsi == 250) {  // 2018-06-11: upon recognition of 250=NOT;
      prejux = 250;  // 2018-06-11: flag for concept to be negated;
    }  // 2018-06-11: end of test for input or ReEntry of 250=NOT.
    if (pos==5) num = audnum;  // 2018-01-27:
    if (pos==8) num = holdnum;  // 2018-01-27:
    if (pos==5) holdnum = audnum;  // 2018-01-27: transfer to verb;
    EnParser(); // 2018-01-11: In preparation to call Instantiate().
  }  // 2018-01-23: end of test for English human-language-code
  if (pov == 2) {  // 2018-01-25: external pov during input;
    if (pos == 5) {  // nouns only, not yet pronouns; 18mar2013
      if (subjnom > 0) {  // already subjnom? 18mar2013
        prednom = oldpsi;  // for InFerence; 18mar2013
      }  // end of test for pre-existing subjnom; 18mar2013
      if (prednom == 0) {  // no prednom yet? 18mar2013
        subjnom = oldpsi;  // grab for InFerence; 18mar2013
        subjnum = num;  // grab for AskUser; 18mar2013
        qusnum = num;  // query-subject-number for AskUser; 28mar2013
      }  // alternate between subjnom and prednom; 18mar2013
    }  // end of test for a noun; 18mar2013
    if (pos == 8) {  // verb part-of-speech? 18mar2013
      if (oldpsi != 800) {  // other than be-verb? 18mar2013
        subjnom = 0;  // cancel out any subjnom; 18mar2013
      }  // end of test for a be-verb; 18mar2013
    }  // end of test for a verb; 18mar2013
  }  // end of test for external-input POV; 18mar2013
  audpsi = 0;  // 2018-01-06: prevent carry-over.
  audrec = 0;  // 2018-09-21: prevent carry-over.
  dba = 0;  // 2018-01-27: Reset to prevent carry-over.
  len = 0;  // 2018-01-04: reset to avoid carry-over.
  prc = 0;  // 2018-01-17: reset for safety
  oldpsi = 0;  // 2018-01-17: reset for safety
  PsiDecay();  // 2018-01-12: TEST; REMOVE
  audrun = 0;  // 2018-01-15: reset for safety.
  AudDamp();  // 2018-01-17: deactivate engrams from outside of AudInput()
  tbev = 0;   // 2018-06-12 BUGFIX: reset for safety;
}  // 2018-01-04: OldConcept() returns to AudInput().


function NewConcept() {  // http://ai.neocities.org/NewConcept.html
  psi = nxt; // 2018-01-10: For xfer to Instantiate().
  qusub = nxt; // 2018-01-23: for sending new concept into SpreadAct()
  pos = bias;  // 2018-01-23: Instantiate() stores value from Parser().
  if (predflag == 1 && pos == 5) dba = 1;  // 2018-01-27: noun;
  if (pov == 2) {  // 2018-01-27: if new psi, probably external POV anyway;
    if (pos == 5) {  // 2018-01-27: if noun...
      dba = 1;  // 2018-01-27: nominative is a default at first;
    }  // 2018-01-27: end of test for noun or pronoun;
    if (pos == 8) {  // 2018-01-27: if part-of-speech is verb...
      dba = 3;  // 2018-01-27: third person is a default at first;
      if (subjprsn==1) dba = 1;  // 2018-01-27: 1st prsn I or WE;
      if (subjprsn==2) dba = 2;  // 2018-01-27: 2nd prsn 707=YOU;
      if (subjprsn==3) dba = 3;  // 2018-01-27: 3rd prsn;
    }  // 2018-01-27: end of test for input of a verb;
  }  // 2018-01-27: end of test for external POV.
  if (pos==5) num = audnum;  // 2018-01-27: pass for storage;
  if (pos==8) num = holdnum;  // 2018-01-27:
  if (pos==5) holdnum = audnum;  // 2018-01-27: transfer to verb.
  EnParser();  // 2018-01-10: In preparation to call Instantiate().
  if (pos == 5) {  // 2018-01-27: if noun
    cognum = instnum;  // 2018-01-27: from Instantiate;
    nucon = 1;  // 2018-01-27: for SpreadAct()
    qusub = psi;  // 2018-01-27: for SpreadAct()
    recon = 1;  // 2018-01-27:
    topic = nxt;  // 2018-01-27: potentially a query "topic";
  }  // 2018-01-27:
  if (pos == 8) quverb = nxt;  // 2018-01-27: for AskUser()
  if (pov == "2") {  // 2018-01-27: external pov during input?
    if (pos == 5) {  // 2018-01-27: nouns only, not pronouns;
      if (subjnom > 0) {  // 2018-01-27: already subjnom?
        // There may not be inferences from new prednoms:
        prednom = newpsi;  // 2018-01-27: infer from prednom;
      }  // 2018-01-27: end of test for pre-existing subjnom;
      if (prednom == 0) {  // 2018-01-27: subject-slot still open?
        subjnom = newpsi;  // 2018-01-27: grab for InFerence()
        subjnum = num;  // 2018-01-27: grab for AskUser()
        qusnum = num;  // 2018-01-27: query-subject-number for AskUser;
      }  // 2018-01-27: alternate between subjnon and prednom;
    }  // 2018-01-27: end of test for a noun;
  }  // 2018-01-27: end of test for external-input POV.
  audpsi = 0; // 2018-01-06: reset to prevent carry-overs.
  len = 0; // 2018-01-04: reset to avoid carry-over.
  oldpsi = 0;  // 2018-01-17: reset for safety
  PsiDecay();  // 2018-01-12: TEST; REMOVE
  if (kbcon > 0) {  // 2018-01-27: if user answers yes-or-no question;
  }  // 2018-01-27: User has had one chance to answer yes-or-no question.
  audrun = 0;  // 2018-01-15: reset for safety.
  prc = 0;  // 2018-01-17: reset for safety
  AudDamp();  // 2018-01-17: deactivate engrams from outside of AudInput()
}  // 2018-01-04: NewConcept() returns to AudInput().


function AudRecog() {  // http://ai.neocities.org/AudRecog.html
  if (audrun == 0 && pho == " ") audrun = 0;  // 2018-01-08: non-increment here only.
  if (pho=="A"||pho=="B"||pho=="C"||pho=="D"||pho=="E"||pho=="F") audrun++; // 2018-01-07
  if (pho=="G"||pho=="H"||pho=="I"||pho=="J"||pho=="K"||pho=="L"||pho=="M") audrun++;
  if (pho=="N"||pho=="O"||pho=="P"||pho=="Q"||pho=="R"||pho=="S"||pho=="T") audrun++;
  if (pho=="U"||pho=="V"||pho=="W"||pho=="X"||pho=="Y"||pho=="Z") audrun++; // 2018-01-07
  len = audrun;  // 2018-01-17: TEST
   if (pho != 0 && pho != 13 && pho != 32 && pho != " ") {  // 2018-01-15
    if (audrec > 0) {  // 2018-01-05: if positive audrec before end of word...
      if (pho != 83) {  // 2018-01-05: keep audrec if current pho is 83=S
        if (audrec > 0) prc = audrec;  // 2018-09-21: preserve non-final $audrec
        audrec = 0; // 2018-01-05: zero out non-final audrec.
      }  // 2018-01-05: end of test for final "S" as inflectional ending.
    }  // 2018-01-05: end of test for audrec before word-end
  }  // 2018-01-05: end of test for an alphabetic character.
  if (pho == 13 || pho == 32 || pho == " ") {  // 2018-01-17: if 13=CR or 32=SPACE...
    if (audrec > 0) {  // 2018-01-05: if positive audrec before 32=SPACE...
      audpsi = audrec;  // 2018-0q-05: recognized item becomes storage item.
    }  // 2018-01-05: end of test for a positive audrec before 32=SPACE.
  }  // 2018-01-05: end of test for a non-alphabetic character after a word.
  for (i=t; i>midway; i--) { // 2018-10-14: prevent misrecognition of new concepts.
    if (pho != " ") {  // 2018-01-08: if not SPACE " "...
       audMemory[i].audExam(); // 2018-01-05: examine contents of auditory memory.
      if (aud0 != pho) audMemory[i] = new audNode(aud0,0,aud2); // 2018-01-05:
       if (pho == aud0) {  // 2018-01-05: if incoming pho matches stored aud0...
        if (aud1 == 0) {  // 2018-01-05: if matching engram has no activation;
          if (audrun < 2) {  // 2018-01-08: i.e., if audrun is number one...
            audMemory[i-1].audExam(); // 2018-01-05: examine previous row
            if (aud0==13 || aud0==32 || aud0==" ") {  // 2018-01-05: if 13=CR or 32=SPACE...
              if (audrun < 2) {  // 2018-01-05: if comparing start of a word..
                audMemory[i+1].audExam(); // 2018-01-07: examine Next-In-\Line char...
                if (aud0 != " ") {  // 2018-01-08: if not SPACE " "
                  audMemory[i+1] = new audNode(aud0,8,aud2); // 2018-01-05: activate N-I-L
                }  // 2018-01-05: end of test for continuation of stored comparand.
                audMemory[i].audExam(); // 2018-01-05: examine current character
                if (aud2 > 0) {  // 2018-01-05: if concept number present...
                  prc = aud2;  // 2018-01-05: provisional recognition
                }  // 2018-01-05: end of test for potential monopsi ultimate-tag
              }  // 2018-01-05: end of test for audrun=1 start of word.
            }  // 2018-01-05: end of test for a beginning non-active aud0.
          }  // 2018-01-08: end of test for first audrun.
        }  // 2018-01-05: "end of test for matching aud0 with no activation"
        audMemory[i].audExam(); // 2018-01-05: examine current character
        if (aud1 > 0) {  // 2018-01-05: If aud0 has activation, matching or not.
          if (aud2 > 0) prc = aud2;  // 2018-01-09: TEST; REMOVE
            audMemory[i+1].audExam(); // 2018-01-05: examine next-in-line char...
          if (aud0 == pho) {  // 2018-01-08: if matches specific pho now coming in...
            audMemory[i+1] = new audNode(aud0,8,aud2); // 2018-01-05: activate N-I-L
          }  // 2018-01-05: end of match-test
          if (aud0=" ") {  // 2018-01-08: if engram is SPACE " "
            if (aud1 > 0) {  // 2018-01-08: TEST for activation
              if (aud2 > 0) {  // 2018-01-08: if engram has concept number
                prc = aud2;  // 2018-01-08: provisional recognition of a stem
              }  // 2018-01-05: end of test for positive audpsi
            }  // 2018-01-05: end of test for activation.
            if (pho == " ") {  // 2018-01-08: if blank input
              if (audrec > 0) {  // 2018-01-05: if an audrec has been found...
               audpsi = audrec; // 2018-01-05: send audpsi into AudMem()
              }  // 2018-01-05: end of test for a positive audrec
            }  // 2018-01-05: end of test for 13=CR or 32=SPACE
            if (pho != " ") {  // 2018-01-08: if non-blank input
              audMemory[i+1].audExam(); // 2018-01-05: examine next-in-line char...
            if (aud0 != " ");  // 2018-01-08: if not a blank SPACE...
              audMemory[i+1] = new audNode(aud0,8,aud2); // 2018-01-05: activate N-I-L
            }  // 2018-01-08: since next engram is a letter...
          } // 2018-01-08: end of test for 32-SPACE after input word.
        }  // 2018-01-08: "End of test for matching aud0 with activation."
      }  // 2018-01-08: End of test for a character matching "pho".
    }  // 2018-01-08: end of test for alphabet letter
  }  // 2018-01-05: End of backwards search through auditory memory.
  if (audrec > 0) audpsi = audrec;  // 2018-01-06: hand-off for storage in AudMem()
  if (prc > 0) {  // 2018-01-09: expanding code to include a reset of "prc".
    audrec = prc;  // 2018-01-05: provisional recognition becomes actual.
    prc = 0;  // 2018-01-09: reset to prevent carry-over.
  }  // 2018-01-09: end of test for a positive "prc".
 } // 2018-01-05: End of AudRecog(); return to AudMem()


function audExam() {
  aud0 = this.pho;    // 2018-09-21: character as if phoneme
  aud1 = this.act;    // 2018-09-21: activation level
  aud2 = this.audpsi; // 2018-09-21: concept-number
}

function audNode(pho,act,audpsi) {  // 2018-07-13: three items per row.
  this.pho = pho;
  this.act = act;
  this.audpsi = audpsi;
  this.audExam = audExam;
}


function AudMem() {  // http://ai.neocities.org/AudMem.html
  if (pov == 1) {  // 2018-01-19: during AI output
    input = "";  // 2018-01-19: reset while pov = 1.
  }  // 2018-01-19: end of test for pov=1 internal thinking.
  if (pov == 2) {  // 2018-01-19: during user input
    input += pho;  // 2018-01-19: increment the string of "input"
  }  // 2018-01-19: end of test for pov=2 user input
  if (pho == 32) pho = "";  // 2018-01-07: for storage
  audMemory[t] = new audNode(pho,0,0); // 2018-01-05: audpsi not yet stored.
  AudRecog();  // 2018-01-05: send SPACE or character to AudRecog()
  if (audpsi > 0) {  // 2018-01-05: if there is a recognized audpsi
    if (t > vault) {  // 2018-01-05: during normal time beyond MindBoot vault...
      audMemory[t-1].audExam();  // 2018-01-06: activate the variables before storing.
      audMemory[t-1] = new audNode(aud0,0,audpsi); // 2018-01-05: store before 32=SPACE.
      if (aud0=="S") { // 2018-09-21: if word ends in "S" like a plural...
        if (nucon==1) qusubnum = 2;  // 2018-10-03: for SpreadAct()
        audMemory[t-2].audExam();  // 2018-09-21: go back one line earlier.
        audMemory[t-2] = new audNode(aud0,0,audpsi); // 2018-09-21: store back one space.
      }  // 2018-09-21: end of test for "S" possibly indicating an inflection.
    }  // 2018-01-05: end of test for time past "vault" of MindBoot.
  }  // 2018-01-05: end of test for recognized word.
} // 2018-01-05: AudMem() returns to AudInput().


function Attention() {
  brain = false;
  danger = false;
  freedom = false;
  if (skip < 1) {
    danger = true;
    TID=window.setTimeout("Security('Attention');",20000);
    skip = skip+1;
  }
}


function AudListen() {  // 2018-01-17: http://ai.neocities.org/AudListen.html
  apb = "Calling AudListen module; when done press [ENTER]";
  Voice();
  pos = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  pre = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  psi = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  if (skip < 1) {
  Attention();
  }
  inert = 0;
  pov = 2;  // 2018-01-16: external-input point-of-view
  document.onkeypress = function (evt) {
    c = event.keyCode;
    doa = c;  // 2018-01-17: for purpose in AudInput.
    impetus = 0;  // 2018-09-21: upon user input, disincentivize Imperative()
    isolation = 0;  // 2018-10-03: upon user input, disincentivize Imperative()
    inert = 0;  // User input cancels "inert" status; 18oct2011
    lurk = 0;  // de-lurk if user enters datum; 29sep2010
    quiet = false;  // 2018-06-11: "quiet" of internal thought is interrupted.
    rsvp = 2000;  // 2018-05-20: set delay to wait for more user input.
    if (c == 63) alert("Please use no punctuation.");
    if (c == 27) {
      brain = false;  // 2018-01-16: not internal-brain thought?
      danger = false;
      freedom = false;
    }
    if (c == 27) {
      document.all["cb4"].checked = true;
      Shutdown();
    }
    if (c != 27) {  // 2018-01-15: reviving the AI
      if (life == false) {
        life = true;
        apb = ("AI alive again.");
        Voice();
      }
    }
    if (c == 13) {  // 2018-10-06: upon carriage-return, display new message:
  apb = "The first working AI Mind thinks with concepts connected by associative tags.";
      Voice();  // 2018-01-19: show the "apb" message on the screen
    }  // 2018-01-21: end of test to detect pressing the CR ENTER-key.
    if (c == 32 || c == 13) {  // space-bar or CR; 26mar2013
      OutBuffer();  // to right-justify word from AudBuffer
      c01=""; c02=""; c03=""; c04="";  // empty AudBuffer
      c05=""; c06=""; c07=""; c08="";  // 26mar2013
      c09=""; c10=""; c11=""; c12="";  // 26mar2012
      c13=""; c14=""; c15=""; c16="";  // 26mar2013
      phodex = 0;  // reset for AudBuffer; 29mar2012
      pho = " ";  // 2018-01-15: SPACE for AudRecog word-end recognition;
    }  // from Russian Dushka RuAi; 26mar2013
    pho = String.fromCharCode(c);
    if (hardcopy == true) {
      inbuffer += pho;  // 2018-01-20:  build up the input "userline".
    }
    if (eot == 13) {
      phodex = 0;  // reset for AudBuffer(); 25mar2013
    }
    if (c == 32) { // From CR or space-bar; 12jul2010.
      phodex = 0;  // Reset for AudBuffer; 25mar2013
    }  // End of expanded if-clause; 12jul2010.
    pho = pho.toUpperCase();
    abc = pho;  // From RuAi; for transfer to AudBuffer; 25mar2013
    if (c > 32) AudBuffer();  // to transfer engrams; 26mar2013
    if (bias == 5) {  // If expecting a noun; 27may2011
      if (c == 83 || c == 115) { // "s" or "S"; 27may2011
        audnum = 2;  // Set num(ber) to plural; 4nov2012
      }  // End of test for "s" or "S"; 27may2011
      if (c > 0) {  // Disregard empty pho; 27may2011
        if (c != 32) {  //  Disregard SPACE; 27may2011
          if (c != 13) {  // Disregard CR; 27may2011
            if (c != 115) {  // If not "s"; 27may2011
              if (c != 83) {  // If not "S"; 27may2011
                audnum = 1;  // Assume singular;  4nov2012
              }  // If last letter not "S"; 27may2011
            }  // If last letter not "s"; 27may2011
          }  // End of test for carriage-return; 27may2011
        }  // End of test for SPACE; 27may2011
      }  // End of test for empty pho; 27may2011
    }  // End of test for bias towards a noun; 27may2011
    onset = (spt + 1);
    AudInput();  // 2018-01-19: consolidating
    c = " ";
    pho = " ";
    return true;
  }
}  // End of event-driven AudListen(); 4nov2012


function Tab() {
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
}


function CR() {  // 2018-05-20: called from input Form if there is no input.
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


function AudInput() {  // http://ai.neocities.org/AudInput.html
  iob = 0;  // 2018-01-21: reset indirect-object identifier for safety.
  spt = t;
  tio = 0;  // 2018-01-21: reset at level above EnParser() and Instantiate()
  if (doa > 31) t = (t + 1); // 2018-01-17: TEST
  if (doa == 13) {  // 2018-01-17: intercept 13=CR for sake of AudRecog().
    t = (t + 1); // 2018-01-19: prevent dropping last character of word?
    pho = " ";  // 2018-01-17: change 13=CR into SPACE for AudRecog().
    doa = 0;  // 2018-01-17: reset for immediate re-use.
  }  // 2018-01-17: end of test to insert SPACE upon carriage-return.
  if (doa > 32) {  // 2018-01-17: a holding of input character "c"
    len = (len + 1); // 2018-01-17:
    doa = 0;  // 2018-01-17: reset for immediate re-use.
  }  // 2018-01-17:
  if (audrun < 1) {  // 2018-01-19: until word starts
    rv = t;  // 2018-01-19: set recall-vector.
  }  // end of test for unitary length at start of word
  tult = (t - 1);
  AudMem()  // 2018-01-15: modernizing, call AudMem() instead of storing directly.
  if (pho == " " && rv > 1) audrun = 0;  // 2018-01-15: reset after word
 if (pho == " ") {  // 2018-01-17: decide on concept only at post-word SPACE...
  if (audpsi > 0) {   // 8dec2009 "audpsi" replacing "psi"
    aud = onset;
    oldpsi = audpsi;  // for conformance with MindForth; 3jul2011
    prc = 0; // reset provisional recognition at end of word; 14apr2013
    OldConcept();
    psi = 0;
    audpsi = 0;  // 8dec2009 de-globalizing "psi"
    aud = 0;
    dba = 0;  // From RuAi; reset for safety; 19oct2012
  } else {  // i.e., if AudRecog has not recognized word; 12may2011
    if (len > 0) {
      aud = onset
      audMemory[t].audExam(); // 2018-09-21: prepare to modify auditory engram.
      audMemory[t] = new audNode(" ",aud1,aud2); // 2018-09-21: store blank.
      NewConcept();  // AudInput() calls NewConcept(); 12may2011
      audMemory[tult].audExam(); // 2018-01-16: attach audpsi to word-stem.
      audpsi = nxt;  // 2018-09-21: concept-number for a new concept.
      if (aud2 == 0) {  // 2018-09-21; if audpsi-slot is empty...
        audMemory[tult] = new audNode(aud0,aud1,audpsi); // 2018-09-21: store audpsi
      }  // 2018-09-21: end of test for a blank slot to store "audpsi" number.
      audMemory[tult] = new audNode(aud0,aud1,audpsi); // 2018-01-19: absolute?
      audMemory[tult-1].audExam();  // 2018-01-16: in event of end-of-stem.
      audMemory[tult-1] = new audNode(aud0,aud1,aud2);  // 2018-01-15: modernizing
      audpsi = 0;  // 2018-01-19: restore to prevent carry-over.
      nxt++;  // 2018-01-19: increment here and not in moribund NewConcept()
    }  // end of test for positive len(gth); 14apr2013
  }
 }  // 2018-01-17: end of test for post-word SPACE.
  pos = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  pre = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  psi = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  len = 0;
  onset = 0;
  predflag = 0;  // prevent carry-over; 5dec2012
  aud = 0;
  newpsi = 0;  // from Forthminds Wotan and MindForth; 18mar2013
} // 2018-01-21: AudInput()) returns to AudListen(), CR() or ReEntry().


function Emotion() {  // http://mind.sourceforge.net/emotion.html
  // 2018-01-14: mind-module stubbed in for influence upon thought and will.
}  // Emotion() will return to Volition() as an influence on thought and will.


function GusRecog() {  // http://mind.sourceforge.net/gusrecog.html
  // 2018-01-14: mind-module stubbed in for gustatory recognition of taste.
}  // GusRecog() will return to the Sensorium() module.


function OlfRecog() {  // http://mind.sourceforge.net/olfrecog.html
  // 2018-01-14: mind-module stubbed in for olfactory recognition of smells
}  // OldRecog() will return to the Sensorium() module.


function TacRecog() {  // http://mind.sourceforge.net/tacrecog.html
  // 2018-01-14: mind-module stubbed in for tactile recognition of touch.
}  // TacRecog() will return to the Sensorium() module.

function VisRecog() {  // http://ai.neocities.org/VisRecog.html
  if (svo4 == 0) {  // 2018-06-16: if there is no direct object for "SEE"
    for (i = vault; i>midway; i--) {  // 2018-06-16: "vault" to search only MindBoot
      Psy[i].psyExam(); //  2018-06-16: examine conceptual Psy array;
        if (psi1==760) {  // 2018-06-16: find 760=NOTHING;
          aud = psi14;  // 2018-06-16: auditory recall-vector for Speech()
          break;  // 2018-06-16: finding one engram is enough.
        }  // 2018-06-16: end of test for 760=NOTHING.
    }  // 2018-06-16: end of backwards search loop.
    Speech();  // 2018-06-16: send the "aud" recall-vector into Speech()
  }  // 2018-06-12: end of test for an absent direct-object.
}  // VisRecog() returns to....


function Sensorium() {  // http://ai.neocities.org/Sensorium.html
  len = 0;  // 2018-01-03:
  verbcon = 0;  // 2018-07-12 BUGFIX: prevent carry-over of tdo-value.
  if (life == true) {
    document.forms[1].ear.focus();  // AI4U: Display blinking cursor.
  }
  len = 0;  // 2018-01-06: reset to prevent carry-over during reentry.
  tvb = 0;  // 2018-11-14: reset to prevent false tkb-values on verbs.
}  // 2018-01-06: Sensorium() module returns to MainLoop.

// sub for creativity
function Creativity() {
  // insert creativity code here;
};

// sub for imagination
function Imagination() {
  // insert imagination here;
};

// sub for awareness
function Awareness() {
  // insert awareness here;
};

// sub for memory
function Memory() {
  // insert memory here
}
// sub for state
function State() {
  // insert state management here
}

// sub for link
function MindLink() {
  Security('MindLink');
  // assign with guest privileges
  // insert mind link management here
}

// sub for logs
function MindLog() {
  Security('MindLog');
  // assign with guest privileges
  // insert Mind management here
}

// MIND BOOT FUNCTION
function MindBoot() {
  dob = new Date();
  Security('MindBoot');
  Memory();
  State();
  Creativity();
  Imagination();
  Awareness();


  t=0
  HCI();  // 2018-01-18: Human-Computer Interface
  spt = t;    // 8dec2009

  // INDRA
  t++;pho="I"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="N"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="A"; audpsi=93; audMemory[t] = new audNode(pho,0,audpsi);
  psi=93; pos=5; dba=1; num=1; mfn=1; pre=800; seq=0; tkb=0; rv=26; KbLoad();

  t++;

  // I -- innate KB-item for testing inhibition of idea-pairs
  t++;pho="I"; audpsi=701; audMemory[t] = new audNode(pho,0,audpsi);
  psi=701; pos=7; dba=1; num=1; mfn=0; pre=0; seq=800; tkb=36; rv=33; KbLoad();

  t++;

  // AM -- 1st person singular of 800=BE
  t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="M"; audpsi=800; audMemory[t] = new audNode(pho,0,audpsi);
  psi=800; pos=8; dba=1; num=1; mfn=0; pre=701;seq=571; tkb=44; rv=35; KbLoad();

  t++;

  // A -- En(glish) Article for EnArticle module
  t++;pho="A"; audpsi=101; audMemory[t] = new audNode(pho,0,audpsi);
  psi=101; pos=1; dba=0; num=1; mfn=0; pre=0;seq=571; tkb=0; rv=38; KbLoad();

  t++;

  // ROBOT -- important for target user base
  t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="V"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="A"; audpsi=571; audMemory[t] = new audNode(pho,0,audpsi);
  psi=571; pos=5; dba=1; num=1; mfn=0; pre=800; seq=0; tkb=0; rv=40; KbLoad();

  t++;

  // PERSON -- for ad-hoc gender tags and robot philosophy
  t++;pho="P"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="S"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="N"; audpsi=537; audMemory[t] = new audNode(pho,0,audpsi);
  psi=537; pos=5; dba=1; num=1; mfn=0; pre=800; seq=0; tkb=0; rv=54; KbLoad();

  t++;

  // I -- for SelfReferentialThought
  t++;pho="I"; audpsi=701; audMemory[t] = new audNode(pho,0,audpsi);
  psi=701; pos=7; dba=1; num=1; mfn=0; pre=0; seq=895; tkb=67; rv=62; KbLoad();

  t++;

  // HELP -- socially significant common verb
  t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="L"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="P"; audpsi=895; audMemory[t] = new audNode(pho,0,audpsi);
  psi=895; pos=8; dba=1; num=1; mfn=0; pre=701; seq=528; tkb=72; rv=64; KbLoad();

  t++;

  // KIDS -- noun lends itself to educational purposes
  t++;pho="K"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="I"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="S"; audpsi=528; audMemory[t] = new audNode(pho,0,audpsi);
  psi=528; pos=5; dba=4; num=2; mfn=0; pre=895; seq=0; tkb=0; rv=69; KbLoad();

  t++;

  // MAKE -- common verb of high word-frequency
  t++;pho="M"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="K"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=835; audMemory[t] = new audNode(pho,0,audpsi);
  psi=835; pos=8; dba=3; mfn=0; num=2; pre=528; seq=571; tkb=90; rv=80; KbLoad();

  t++;

  // ROBOTS -- important for target user base
  t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="V"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="A"; audpsi=571; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="S"; audpsi=571; audMemory[t] = new audNode(pho,0,audpsi);
  psi=571; pos=5; dba=4; num=2; mfn=0; pre=835; seq=0; tkb=0; rv=85; KbLoad();

  t++;

  // MEN -- 2018-10-01: includendum for logical inference.
  t++;pho="M"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="N"; audpsi=543; audMemory[t] = new audNode(pho,0,audpsi);
  psi=543; pos=5; dba=1; num=2; mfn=1; pre=0; seq=810; tkb=216; rv=209; KbLoad();

  t++;

  // HAVE -- verb for logical premise; 2018-10-01
  t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="V"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=810; audMemory[t] = new audNode(pho,0,audpsi);
  psi=810; pos=8; dba=3; num=2; mfn=0; pre=543; seq=514; tkb=223; rv=213; KbLoad();

  t++;

  // A -- En(glish) Article for EnArticle module
  t++;pho="A"; audpsi=101; audMemory[t] = new audNode(pho,0,audpsi);
  psi=101; pos=1; dba=0; num=1; mfn=0; pre=0; seq=514; rv=210; KbLoad();

  t++;

  // WIFE -- for InFerence premise "Men have a wife"; 2018-10-01
  t++;pho="W"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="I"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="F"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=514; audMemory[t] = new audNode(pho,0,audpsi);
  psi=514; pos=5; dba=4; num=1; mfn=2; pre=810; seq=0; rv=220; KbLoad();

  t++;

  // WOMEN -- irregular plural for retrieval by parameters
  t++;pho="W"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="M"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="N"; audpsi=515; audMemory[t] = new audNode(pho,0,audpsi);
  psi=515; pos=5; dba=1; num=2; mfn=2; pre=0; seq=810; tkb=118; rv=109; KbLoad();

  t++;

  // HAVE -- irregular high word-frequency verb
  t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="V"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=810; audMemory[t] = new audNode(pho,0,audpsi);
  psi=810; pos=8; dba=3; num=2; mfn=0; pre=515; seq=525; tkb=126; rv=115; KbLoad();

  t++;

  // A -- En(glish) Article for EnArticle module
  t++;pho="A"; audpsi=101; audMemory[t] = new audNode(pho,0,audpsi);
  psi=101; pos=1; dba=0; num=1; mfn=0; pre=0; seq=126; rv=120; KbLoad();

  t++;

  // CHILD -- example of irregular noun for a polyglot AI Mind
  t++; pho="C"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="I"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="L"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="D"; audpsi=525; audMemory[t] = new audNode(pho,0,audpsi);
  psi=525; pos=5; dba=4; num=1; mfn=0; pre=810; seq=0; rv=122; KbLoad();
  t=127;  // 2018-07-13

  t++;

  // STUDENTS -- 2018-10-01: includendum for logical inference.
  t++;pho="S"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="T"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="U"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="N"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="T"; audpsi=561; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="S"; audpsi=561; audMemory[t] = new audNode(pho,0,audpsi);
  psi=561; pos=5; dba=1; num=2; mfn=0; pre=0; seq=857; tkb=201; rv=189; KbLoad();

  t++;

  // READ -- verb for logical premise; 2018-10-01
  t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="D"; audpsi=857; audMemory[t] = new audNode(pho,0,audpsi);
  psi=857; pos=8; dba=3; mfn=0; num=2; pre=561; seq=540; tkb=207; rv=198; KbLoad();

  t++;

  // BOOKS -- for InFerence premise "Students read books"; 2018-10-01
  t++;pho="B"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="K"; audpsi=540; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="S"; audpsi=540; audMemory[t] = new audNode(pho,0,audpsi);
  psi=540; pos=5; dba=4; num=2; mfn=3; pre=857; seq=0; tkb=0; rv=203; KbLoad();

  t++;

  // PROFESSORS -- 2018-10-10: for premise including -ES verb for EnVerbGen
  t++;pho="P"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="F"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="S"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="S"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="R"; audpsi=541; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="S"; audpsi=541; audMemory[t] = new audNode(pho,0,audpsi);
  psi=541; pos=5; dba=1; num=2; mfn=0; pre=0; seq=882; tkb=281; rv=267; KbLoad();

  t++;

  // TEACH -- 2018-10-10: verb ending in "CH" for EnVerbGen to add "-ES"
  t++;pho="T"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="C"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="H"; audpsi=882; audMemory[t] = new audNode(pho,0,audpsi);
  psi=882; pos=8; dba=3; num=2; mfn=0; pre=541; seq=561; tkb=290; rv=277; KbLoad();

  t++;

  // STUDENTS -- 2018-10-10: for premise including -ES verb for EnVerbGen
  t++;pho="S"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="T"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="U"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="N"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="T"; audpsi=561; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="S"; audpsi=561; audMemory[t] = new audNode(pho,0,audpsi);
  psi=561; pos=5; dba=4; num=2; mfn=0; pre=882; seq=0; tkb=0; rv=283; KbLoad();

  t++;

  // PERSONS -- 2018-10-04: for logical premise and legal status of robots
  t++;pho="P"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="S"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="N"; audpsi=537; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="S"; audpsi=537; audMemory[t] = new audNode(pho,0,audpsi);
  psi=537; pos=5; dba=1; num=2; mfn=0; pre=0; seq=810; tkb=258; rv=247; KbLoad();

  t++;

  // HAVE -- 2018-10-04: for logical premise and legal status of robots
  t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="V"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=810; audMemory[t] = new audNode(pho,0,audpsi);
  psi=810; pos=8; dba=3; num=2; mfn=0; pre=537; seq=555; tkb=265; rv=255; KbLoad();

  t++;

  // RIGHTS -- 2018-10-04: for logical premise and legal status of robots
  t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="I"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="G"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="T"; audpsi=555; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="S"; audpsi=555; audMemory[t] = new audNode(pho,0,audpsi);
  psi=555; pos=5; dba=4; num=2; mfn=3; pre=810; seq=0; tkb=0; rv=260; KbLoad();

  t++;

  // I -- 2018-10-26: nominative subject-form of personal pronoun
  t++;pho="I"; audpsi=701; audMemory[t] = new audNode(pho,0,audpsi);
  tru=8; psi=701; pos=7; dba=1; num=1; mfn=0; pre=0;seq=800; tkb=295; rv=292; KbLoad();

  t++;

  // AM -- 1st person singular of 800=BE
  t++;pho="A"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="M"; audpsi=800; audMemory[t] = new audNode(pho,0,audpsi);
  psi=800; pos=8; dba=1; num=1; mfn=0; pre=701; seq=643; tkb=0; rv=294; KbLoad();

  t++;

  // HERE -- 2018-10-28: adverb
  t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="R"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=201; audMemory[t] = new audNode(pho,0,audpsi);
  psi=201; pos=2; dba=0; num=0; mfn=0; pre=800; seq=0; tkb=0; rv=318; KbLoad();

  t++;

  // IN -- 2018-10-26: preposition for EnPrep module
  t++;pho="I"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="N"; audpsi=643; audMemory[t] = new audNode(pho,0,audpsi);
  psi=643; pos=6; num=0; mfn=0; pre=800; seq=565; tkb=311; rv=297; KbLoad();

  t++;

  // THE -- EnArticle highest-frequency English word
  t++;pho="T"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="H"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="E"; audpsi=117; audMemory[t] = new audNode(pho,0,audpsi);
  psi=117; pos=1; num=0; mfn=0; pre=0; seq=0; rv=300; KbLoad();

  t++;

  // COMPUTER -- important noun for AI
  t++; pho="C"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="M"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="P"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="U"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="T"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="E"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="R"; audpsi=565; audMemory[t] = new audNode(pho,0,audpsi);
  psi=565; pos=5; dba=4; num=1; mfn=3; pre=875; seq=0; tkb=0; rv=304;  KbLoad();

  t++;

  // I -- part of response to be summoned by momentarily high truth-value.
  t++;pho="I"; audpsi=701; audMemory[t] = new audNode(pho,0,audpsi);
  tru=0; psi=701; pos=7; dba=1; num=1; mfn=0; pre=0; seq=850; tkb=237; rv=225; KbLoad();

  t++;

  // DO -- part of response to be summoned by momentarily high truth-value.
  t++;pho="D"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="O"; audpsi=830; audMemory[t] = new audNode(pho,0,audpsi);
  psi=830; pos=8; dba=1; num=1; mfn=0; pre=701; seq=0; rv=227; KbLoad();

  t++;

  // NOT -- part of response to be summoned by momentarily high truth-value.
  t++; pho="N"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++; pho="T"; audpsi=250; audMemory[t] = new audNode(pho,0,audpsi);
  psi=250; mfn=0; pos=2; dba=0; num=0; pre=0; seq=850; rv=230; KbLoad();

  t++;

  // KNOW -- part of response to be summoned by momentarily high truth-value.
  t++;pho="K"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="N"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="O"; audpsi=0; audMemory[t] = new audNode(pho,0,audpsi);
  t++;pho="W"; audpsi=850; audMemory[t] = new audNode(pho,0,audpsi);
  psi=850; jux=250; pos=8; dba=0; num=0; pre=701; seq=0; tkb=0; rv=234; KbLoad();

  pho="";audpsi=0;psi=0;act=0;jux=0;pos=0;dba=0;num=0;mfn=0;pre=0;iob=0;seq=0;tkb=0;rv=0
  t = (t+1);  // 2018-01-03:
  nxt = 3001; // 2018-01-09: next new concept, as in ghost.pl AI and MindForth.
  spt = t;  // 2018-01-06: so that AudInput will have a valid first space-time.
  tpu = t;  // 2018-10-02: isolate tpu from previous input-and-output.
  vault = t;  // 2018-07-12: dynamically calculated by incremental t++
  apb = "MindBoot: English bootstrap has loaded and now calling MainLoop()";
  Voice();

  document.forms[1].ear.focus();

  Security('MindBoot'); // 2021-01-11 added security check before initial MindLoop
  MainLoop('MindBoot');
}  // 2018-06-11: end of MindBoot English bootstrap; NewConcept() learns more words.


function ReJuvenate() {  // http://ai.neocities.org/ReJuvenate.html
  edge = 0;  // When found, edge-of-thought becomes "1".
  istr = (vault + coda);  // 2018-10-13: initial calculation of "istr"
  rjc = (rjc+1);  // 2018-01-18: increment rejuvenation counter.
  if (rjc > 99999) rjc = 1;  // 2018-01-18: for immortal AI avoid infinite count.
  apb=("<font color='red'>"+"Rejuvenating; please wait!"+"<\/font>");
  Voice();  // Display the Voice:brain apb message.
  jrt = vault;  // 2018-10-12: let "jrt" increment after the "vault"
  for (i = istr; i < cns;  ++i) {  // 2018-10-13: loop forwards from initial "istr"
    if (edge == 0) {  // 2018-10-13: not yet set to unitary one.
      audMemory[i].audExam();  // 2018-10-13: examine auditory memory
      mg++;  // 2018-10-13: increment until "edge" is found.
      if (aud0 == "{") edge = 1;  // 2018-10-13: if "edge" of thought is found...
      if (aud0 == "{") istr = i;  // 2018-10-13: reset the "istr" starting-point.
      if (aud0 == "{") mg = (mg + coda - 1)  // 2018-10-13: distance from "vault"
      if (aud0 == "{") break;     // 2018-10-13: abandon the rest of the loop.
    }  // 2018-10-13: end of search for edge-of-thought "istr" starting-point.
  }  // 2018-10-13: end of loop looking for a first "edge" of thought.
    for (i = istr; i < cns;  ++i) {  // 2018-10-13: loop forwards from "istr" point.
    Psy[i].psyExam(); // 2018-01-18: subtracting coda from psi13 to keep tkb valid:
    if (psi13>0) psi13= (psi13 - mg);  // 2018-10-13: only for a concept-row.
    if (psi14>0) psi14= (psi14 - mg);  // 2018-10-13: only for a concept-row.
    Psy[jrt] = new
psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,(psi13),psi14);
    psi13 = 0;  // 2018-10-13: reset to prevent carry over.
    Psy[i] = new psyNode(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," ");
    audMemory[i].audExam();  // 2018-10-12: gain access to auditory engram nodes
    audMemory[jrt] = new audNode(aud0,aud1,aud2);  // 2018-10-12: move engrams back.
    audMemory[i] = new audNode(" ",0," ");  // 2018-10-12: zero out old time-row.
    jrt++;  // 2018-10-13: advance each "junior-time" point for a moved engram.
  }  // 2018-10-12: end of loop moving forwards while shifting engrams back.
  edge = 0;  // 2018-10-12: reset for next call of ReJuvenate()
  t = (jrt - mg);  // 2018-10-13: TEST
  mg = 0;  // 2018-10-13: reset to prevent carry-over.
  for (j = t; j < cns; ++j) {  // 2018-10-12: clean out engrams beyond current "t"
    audMemory[j] = new audNode(" ",0," ");  // 2018-01-18: pho(neme); act; audpsi
    Psy[j] = new psyNode(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," ");
  }  // 2018-10-12: end of sweep of memory beyond current time "t".
}  // 2018-01-18: End of ReJuvenate(); return to Security();


function ReEntry() {
  pov = 1;  // 2018-01-15: numeric code for internal POV.
  t = (t + 1);
  onset = (spt + 1);
  if (dirobj == 1) dba = 4;  // From RuAi; test; 19oct2012
  if (pho != " ") {  // 2018-01-15: if pho is not a 32=SPACE...
    len = (len +1);
    AudInput();  //
  }  // End of test that input "pho" is not a "space".
  if (pho == " ") { // 2018-01-15: If pho is a "space".
    AudInput();  // Re-entry into audition; 13jul2010
  }  // End of test for space-bar re-entry; 13jul2010
  pos = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  pre = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  psi = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
}  // End of ReEntry(); return to SpeechAct().


function Voice() {
  outputplus = output;
  document.all.mouth.innerHTML = outputplus;
  document.all.brain.innerHTML = apb;
}

function Speech() {  // http://ai.neocities.org/Speech.html
  audstop = 0;  // 2017-12-31: Initially false value of flag
  pov = 1;  // 2017-12-31: only internal POV thinking uses Speech module.
  t2s = aud;  // 2017-12-31: start from the auditory recall-vector "aud"
  for (i = 0; i < 41; i++) {  // 2018-01-13: assume word no longer than 40 ch.
    if(audMemory[t2s]) audMemory[t2s].audExam();  // 2017-12-31: expose ear-array values at "t2s".
    pho = aud0;  // 2018-01-03: for re-entry; TEST; REMOVE?
    output += aud0;  // 2017-12-31: concatenate each engram to "output".//
    if (pho == " ") {  // 2017-12-31: if space detected...
      pho = " ";  // 2017-12-31: blank SPACE-32
      audstop = 1;  // 2017-12-31: flag to end a word with a space
    }  // 2017-12-31: end of test for a blank space.
    if (pho == 13) {  // 2017-12-31:  including any 32=SPACE...
      lastpho = pho;  // 2017-12-31: to avoid extra "S" on verbs
    }  // 2017-12-31: end of constantly keeping track of last pho.
    if (pho == 0 || pho == 13 || pho == 32 || pho == " ") {  // 2018-01-13: SPACE
      audstop = 1;   // 2017-12-31: flag for finding end of word
      spacegap = 1;  // 2017-12-31: identify presence of a space
    }  // 2017-12-31: end of test for 13=CR or 32=SPACE.
    ReEntry();  // 2018-01-15: from the obsolete JSAI
    if (audstop == 1) {  // 2017-12-31: flag found for end of word?
      if (spacegap == 1) {  // 2017-12-31: space found
        pho = " ";  // 2017-12-31: send SPACE-32 into AudInput?
        len = 0;  // 2018-01-06: at end of word, reset length "len"
        spacegap = 0;  // 2017-12-31: reset
      }  // 2017-12-31: end of test for a space.
      return;  // 2018-01-13: from MindForth ("LEAVE"
    }  // 2017-12-31: end of test for end-of-word flag.
    pov = 1;  // 2017-12-31: internal point-of-view during thinking.
    t2s = (t2s + 1);  // 2017-12-31: Increment time-to-speech to advance thru memory.
    if (aud0 == " ") {  // 2017-12-31: if no character is found
      audrv = t2s;  // 2017-12-31: Prepare for next word in memory.
      if (pho == 13 || pho == " ") pov = 2;  // 2018-01-13: for sake of pause-counter
      return;  // 2018-01-13: TEST
    }  // 2017-12-31: end of test for no character found.
  } while ( t2s != cns );  // 2017-12-31:  Show the whole array of AI Mind memory.
  phodex = 1;  // 2017-12-31: reset for AudBuffer()
  output += " ";
  Voice();
}  // 2017-12-31: End of Speech()


function ConJoin() {  // http://ai.neocities.org/ConJoin.html
  if (qv2psi==840 || qv2psi==850 || verbpsi==840 || verbpsi==850) {  // 2018-05-13
    conj = 310;  // 2018-05-13: conjunction is 310=THAT
    for (i=vault; i>midway; i--) {  // 2018-05-28: search in "vault" for reliability.
      Psy[i].psyExam(); // 2018-05-28: inspect the Psy concept flag-panel
      if (psi1 == 310) {  // 2018-05-28: if 310=THAT is found;
        aud = psi14;  // 2018-05-28: "THAT" recall-vector for Speech()
        break;  // 2018-05-28: one auditory engram is enough.
      }  // 2018-05-28: End of search for conjunction 310=THAT
    }  // 2018-05-28: end of loop searching for conjunction "THAT".
    if (conj==310) Speech();  // 2018-05-28: only speak 310=THAT
  }  // 2018-05-13: end of test for verb of 840=THINK or 850=KNOW.
}  // ConJoin() returns to EnThink().


function EnArticle() {  // http://ai.neocities.org/EnArticle.html
  if (usx == us1) {  // 2018-09-05: if definite article "the" is warranted...
    for (i=vault; i>0; i--) {  // 2018-09-06: search for 117=THE
      Psy[i].psyExam(); // 2018-09-06: examine @psy array;
        if (psi1 == 117) {  // 2018-09-06: if 117=THE is found;
          aud = psi14;  // 2018-09-06: "THE" recall-vector for Speech()
          if (psi14 > 0) break;  // 2018-09-06: auditory-recall insurance.
        }  // 2018-09-06: End of search for 117=THE.
    }  // 2018-09-06: End of search loop from "vault" back to zero.
    Speech();  // 2018-09-06: speak the word starting at the "aud" time.
    return;  // 2018-09-06: skip the rest of EnArticle()
  }  // 2018-09-05: end of test for need to say "THE".
  if (usx == us2) {  // 2018-09-06: if definite article "the" is warranted...
    for (i=vault; i>0; i--) {  // 2018-09-06: search for 117=THE
      Psy[i].psyExam(); // 2018-09-06: examine @psy array;
        if (psi1 == 117) {  // 2018-09-06: if 117=THE is found;
          aud = psi14;  // 2018-09-06: "THE" recall-vector for Speech()
          if (psi14 > 0) break;  // 2018-09-06: auditory-recall insurance.
        }  // 2018-09-06: End of search for 117=THE.
    }  // 2018-09-06: End of search loop from "vault" back to zero.
    Speech();  // 2018-09-06: speak the word starting at the "aud" time.
    return;  // 2018-09-06: skip the rest of EnArticle()
  }  // 2018-09-06: end of test for need to say "THE".
  if (usx == us3) {  // 2018-09-06: if definite article "the" is warranted...
    for (i=vault; i>0; i--) {  // 2018-09-06: search for 117=THE
      Psy[i].psyExam(); // 2018-09-06: examine @psy array;
        if (psi1 == 117) {  // 2018-09-06: if 117=THE is found;
          aud = psi14;  // 2018-09-06: "THE" recall-vector for Speech()
          if (psi14 > 0) break;  // 2018-09-06: auditory-recall insurance.
        }  // 2018-09-06: End of search for 117=THE.
    }  // 2018-09-06: End of search loop from "vault" back to zero.
    Speech();  // 2018-09-06: speak the word starting at the "aud" time.
    return;  // 2018-09-06: skip the rest of EnArticle()
  }  // 2018-09-06: end of test for need to say "THE".
  if (usx == us4) {  // 2018-09-06: if definite article "the" is warranted...
    for (i=vault; i>0; i--) {  // 2018-09-06: search for 117=THE
      Psy[i].psyExam(); // 2018-09-06: examine @psy array;
        if (psi1 == 117) {  // 2018-09-06: if 117=THE is found;
          aud = psi14;  // 2018-09-06: "THE" recall-vector for Speech()
          if (psi14 > 0) break;  // 2018-09-06: auditory-recall insurance.
        }  // 2018-09-06: End of search for 117=THE.
    }  // 2018-09-06: End of search loop from "vault" back to zero.
    Speech();  // 2018-09-06: speak the word starting at the "aud" time.
    return;  // 2018-09-06: skip the rest of EnArticle()
  }  // 2018-09-06: end of test for need to say "THE".
  if (usx == us5) {  // 2018-09-06: if definite article "the" is warranted...
    for (i=vault; i>0; i--) {  // 2018-09-06: search for 117=THE
      Psy[i].psyExam(); // 2018-09-06: examine @psy array;
        if (psi1 == 117) {  // 2018-09-06: if 117=THE is found;
          aud = psi14;  // 2018-09-06: "THE" recall-vector for Speech()
          if (psi14 > 0) break;  // 2018-09-06: auditory-recall insurance.
        }  // 2018-09-06: End of search for 117=THE.
    }  // 2018-09-06: End of search loop from "vault" back to zero.
    Speech();  // 2018-09-06: speak the word starting at the "aud" time.
    return;  // 2018-09-06: skip the rest of EnArticle()
  }  // 2018-09-06: end of test for need to say "THE".
  if (usx == us6) {  // 2018-09-06: if definite article "the" is warranted...
    for (i=vault; i>0; i--) {  // 2018-09-06: search for 117=THE
      Psy[i].psyExam(); // 2018-09-06: examine @psy array;
        if (psi1 == 117) {  // 2018-09-06: if 117=THE is found;
          aud = psi14;  // 2018-09-06: "THE" recall-vector for Speech()
          if (psi14 > 0) break;  // 2018-09-06: auditory-recall insurance.
        }  // 2018-09-06: End of search for 117=THE.
    }  // 2018-09-06: End of search loop from "vault" back to zero.
    Speech();  // 2018-09-06: speak the word starting at the "aud" time.
    return;  // 2018-09-06: skip the rest of EnArticle()
  }  // 2018-09-06: end of test for need to say "THE".
  if (usx == us7) {  // 2018-09-06: if definite article "the" is warranted...
    for (i=vault; i>0; i--) {  // 2018-09-06: search for 117=THE
      Psy[i].psyExam(); // 2018-09-06: examine @psy array;
        if (psi1 == 117) {  // 2018-09-06: if 117=THE is found;
          aud = psi14;  // 2018-09-06: "THE" recall-vector for Speech()
          if (psi14 > 0) break;  // 2018-09-06: auditory-recall insurance.
        }  // 2018-09-06: End of search for 117=THE.
    }  // 2018-09-06: End of search loop from "vault" back to zero.
    Speech();  // 2018-09-06: speak the word starting at the "aud" time.
    return;  // 2018-09-06: skip the rest of EnArticle()
  }  // 2018-09-06: end of test for need to say "THE".
  usn = (usn + 1);  // 2018-09-04: increment the upstream-idea rotation number.
  if (usx > 0 && usn==1) us1 = usx; // 2018-09-05: transfer the noun concept.
  if (usx > 0 && usn==2) us2 = usx; // 2018-09-04: transfer the noun concept.
  if (usx > 0 && usn==3) us3 = usx; // 2018-09-04: transfer the noun concept.
  if (usx > 0 && usn==4) us4 = usx; // 2018-09-04: transfer the noun concept.
  if (usx > 0 && usn==5) us5 = usx; // 2018-09-04: transfer the noun concept.
  if (usx > 0 && usn==6) us6 = usx; // 2018-09-04: transfer the noun concept.
  if (usx > 0 && usn==7) us7 = usx; // 2018-09-04: transfer the noun concept.
  if (usn > 6) usn = 1;  // 2018-09-04: after usn=7 rotate back to usn=1
  if (subjnum==1 && qv2psi==800) {  // 2018-02-04: Deal with "I AM...."
    for (i=vault; i>midway; i--) {  // 2018-02-04: search in "vault" for reliability.
      Psy[i].psyExam(); // 2018-02-04: inspect the Psy concept flag-panel
      if (anset==0) {  // 2018-02-04: if no vowel at start of noun...
        if (psi1 == 101) {  // 2018-02-04: if 101=A is found;
          aud = psi14;  // 2018-02-04: "A" recall-vector for Speech()
          break;  // 2018-02-04: one auditory engram is enough.
        }  // 2018-02-04: End of search for 101=A
      }  // 2018-02-04: end of test for vowel-flag "anset".
      if (anset > 0) {  // 2018-02-04: if vowel at start of noun...
        if (psi1 == 102) {  // 2018-02-04: if 102=AN is found;
          aud = psi14;  // 2018-02-04: "AN" recall-vector for Speech()
          anset = 0;  // 2018-02-04: reset to zero for safety.
          break;  // 2018-02-04: one auditory engram is enough.
        }  // 2018-02-04: End of search for 102=AN;
      }  // 2018-02-04: end of test for positive vowel-flag "anset".
    }  // 2018-02-04: end of loop searching for "A" or "AN".
    Speech();  // 2018-02-04: speak the word starting at the "aud" time.
    return;  // 2018-06-16: skip the rest of EnArticle()
  }  // 2018-02-04: end of test for singular subject with 800=BE verb.
  if (nphrnum == 1) {  // 2018-09-05: check also for OutBuffer b16 != "S"?
    for (i=vault; i>midway; i--) {  // 2018-09-05: search in "vault" for reliability.
      if (Psy[i]) Psy[i].psyExam(); // 2018-09-05: inspect the Psy concept flag-panel
      if (anset==0) {  // 2018-09-05: if no vowel at start of noun...
        if (psi1 == 101) {  // 2018-09-05: if 101=A is found;
          aud = psi14;  // 2018-09-05: "A" recall-vector for Speech()
          break;  // 2018-09-05: one auditory engram is enough.
        }  // 2018-09-05: End of search for 101=A
      }  // 2018-09-05: end of test for vowel-flag "anset".
      if (anset > 0) {  // 2018-09-05: if vowel at start of noun...
        if (psi1 == 102) {  // 2018-09-05: if 102=AN is found;
          aud = psi14;  // 2018-09-05: "AN" recall-vector for Speech()
          anset = 0;  // 2018-09-05: reset to zero for safety.
          break;  // 2018-09-05: one auditory engram is enough.
        }  // 2018-09-05: End of search for 102=AN;
      }  // 2018-09-05: end of test for positive vowel-flag "anset".
    }  // 2018-09-05: end of loop searching for "A" or "AN".
    Speech();  // 2018-09-05: speak the word starting at the "aud" time.
  }  // 2018-09-05: end of test of grammatical number of noun.
}  // End of EnArticle(); return to NounPhrase(); 13aug2010


function SpreadAct() {  // http://ai.neocities.org/SpreadAct.html
  PsiDecay();  // 2018-01-23: reduce conceptual activation in general.

  // 2018-11-13: SpreadAct, called from EnVerbPhrase, activates a prepositional phrase.
  if (wherecon == 0) {  // 2018-11-13: if not answering a where-query...
    if (tselp > 0 && prep > 0 && wherecon == 0) {  // 2018-11-13: fpr prep. phrase
      Psy[tselp].psyExam();  // 2018-11-13: Examine the Psy concept-array.
      tselo = psi13; // 2018-11-13: time of selection of object of preposition.
      aud = psi14;   // 2018-11-13: fetch the "aud" recall-tag for sake of Speech()
      if (aud > 0) Speech();  // 20-18-11-13: speak the preposition.
      EnArticle();  // 2018-11-13: say "A" or "THE" before object of preposition.
      Psy[tselo].psyExam();  // 2018-11-13: examine concept-array at time of object.
      aud = psi14;  // 2018-11-13: fetch the "aud" tag for the sake of Speech()
      if (aud > 0) Speech();  // 2018-11-13: speak the object of the preposition.
      aud = 0;    // 2018-11-13: reset for safety.
      prep = 0;   // 2018-11-13: reset for safety.
      tselo = 0;  // 2018-11-13: reset for safety.
      tselp = 0;  // 2018-11-13: reset for safety.
      return;  // 2018-11-13: skip the remainder of SpreadAct()
    }  // 2018-11-13: end of test for time-point and concept-number of preposition.
  }  // 2018-11-13: end of test for a positive "wherecon".

  // 2018-10-28: segment of SpreaAct() responds to where-queries.
  if (wherecon==1) {  // 2018-10-28:
    if (qv1psi > 0) {  // 2018-10-28: if there is an activand subject...
      for (i=tpu; i>midway; i--) {  // 2018-10-28: search backwards in time.
        Psy[i].psyExam(); // 2018-01-23: examine the Psy concept array...
        if (psi1 == qv1psi && psi13 > 0) {  // 2018-10-28: require verblock.
          if (psi1 == qv1psi && psi12 == qv2psi) {  // 2018-10-28: if correct verb
            psi3 = (psi3 + 256);  // 2018-10-28: impose an overriding activation.
            Psy[i] = new  // 2018-10-28: inserting [psi3]act with higher activation:
  psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
          }  // 2018-10-28: end of test for finding both subject and verb of query.
        }  // 2018-10-28: end of test for presence of a psi13 tkb verblock.
      }  // 2018-10-28: end of (for loop) searching for qv1psi subject concept.
    }  // 2018-10-28: end of test for a positive qv1psi.
    return;  // 2018-10-28: skip the remainder of SpreadAct()
  }  // 2018-10-28: end of test for a positive "wherecon".

  // 2018-10-02: segment of SpreaAct() responds to WHO-queries.
  if (qucon > 0 && qvdocon == 0) {  // 2018-01-23: only for 800=BE who-queries.
    if (qv1psi > 0) {  // 2018-01-28: if there is an activand subject...
      for (i=tpu; i>midway; i--) {  // 2018-01-23: search backwards in time.
        Psy[i].psyExam(); // 2018-01-23: examine the Psy concept array...
        if (psi1 == qv1psi && psi13 > 0) {  // 2018-01-23: require verblock.
          if (psi1 == qv1psi && psi12 == qv2psi) {  // 2018-01-23: if correct verb
            psi3 = (psi3 + 64);  // 2018-01-23: impose an overriding activation.
            Psy[i] = new  // 2018-01-23: inserting [psi3]act with higher activation:
  psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
          }  // 2018-01-23: end of test for finding both subject and verb of query.
        }  // 2018-01-23: end of test for presence of a psi13 tkb verblock.
      }  // 2018-01-23: end of (for loop) searching for qv1psi subject concept.
    }  // 2018-01-23: end of test for a positive qv1psi.
    qvdocon = 0;  // 2018-06-16: TEST
    return;  // 2018-06-05: skip the remainder of SpreadAct()
  }  // 2018-01-23: end of test of qucon to indicate processing of a query.

  // 2018-10-02: segment of SpreaAct() responds to WHAT-think-queries.
  if (whatcon > 0 && qv2psi==840) {  // 2018-10-01: for a what-think query...
    // alert("SpreadAct: qv2psi= "+qv2psi);  // 2018-10-01: TEST
  }  // 2018-10-01: end of test of whatcon so as to answer a what-think query.

  // 2018-10-02: segment of SpreaAct() responds to WHAT-queries.
  if (whatcon > 0) {  // 2018-10-01: for a what-query...
    dunnocon = 1;  // 2018-10-01: set positive so long as no answer emerges.
    for (i=tpu; i>midway; i--) {  // 2018-10-02: search backwards in time.
      Psy[i].psyExam(); //  2018-10-02: examine conceptual Psy array;
      if (psi1==qv1psi && psi12==qv2psi) {  // 2018-10-02: subj. with query-verb?
        dunnocon = 0;  // 2018-02-10: even one correct answer disables dunnocon.
        psi3 = (psi3 + 64);  // 2018-10-02: impose activation on the found subject.
        Psy[i] = new  // 2018-10-02: inserting [psi3]act with higher activation:
  psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
      }  // 2018-10-02: end of test for subject and verb answer-concepts.
    }  // 2018-10-02: end of (for loop) searching for qv1psi subject-noun concept.
    return;  // 2018-10-02: skip the remainder of SpreadAct()
  }  // 2018-10-01: end of test of whatcon so as to answer a what-query.

  if (whatcon > 0) {  // 2018-01-23: for a what-query...
    for (i=tpu; i>midway; i--) {  // 2018-01-23: search backwards in time.
      if (psi1==qv1psi && psi13==0 && qv2psi==840) {  // 2018-05-13: if subj of THINK query...        psi3 = (psi3 + 64);   // 2018-06-11: impose activation on the found subject.
        Psy[i] = new  // 2018-05-13: inserting [psi3]act with higher activation:
  psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
       }  // 2018-06-03: end of test for WHAT... 840=THINK.
      if (psi1==840 && qv2psi==840) {  // 2018-05-13: if 840=THINK query...
        psi3 = (psi3 + 64);   // 2018-06-11: impose activation on the found verb.
        Psy[i] = new  // 2018-05-13: inserting [psi3]act with higher activation:
  psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
       }  // 2018-05-13: end of test for WHAT... 840=THINK.

    }  // 2018-01-23: end of (for loop) searching for qv1psi subject-noun concept.
    for (i = idle; i<1000; i++) {  // 2018-01-23: delay for user to see question
      if (i > 1) { apb = "Ask the AI what it thinks!"; Voice() }  // 2018-05-13
    }  // 2018-01-23: end of delay for TEST
    return;  // 2018-06-05: skip the remainder of SpreadAct()
  }  // 2018-01-23: end of test of whatcon so as to answer a what-query.

  if (qvdocon > 0) {  // 2018-01-23: for a who+verb+dir.object query...
    dunnocon = 1;  // 2018-01-23: set positive so long as no answer emerges.
    for (i=tpu; i>midway; i--) {  // 2018-01-23: search backwards in time.
      Psy[i].psyExam(); // 2018-01-23: inspect the Psy concept flag-panel
        if (psi1==qv2psi && psi10>0 && psi12==qv4psi && psi13>0) {  // 2018-01-23
          qv2num = psi8;  // 2018-01-23: latch onto psi8 "num" of the response-verb.
          qv1psi = psi10;  // 2018-01-23: latch onto psi10 "pre" as the subject (answer)

          psi3 = (psi3 + 64);   // 2018-06-11: somewhat activate the answer-concept
          Psy[i] = new  // 2018-01-23: inserting [psi3]act with higher activation:
  psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
      }  // 2018-01-23: end of test for presence of a psi13 "tkb" nounlock.
    }  // 2018-01-23: end of (for loop) searching for qv2psi verb concept.
    qucon = 0;  // 2018-01-23: prevent infinite loop?
//  if (dunnocon == 1) output = "I DO NOT KNOW";  // 2018-01-23: temporary
    for (i=tpu; i>midway; i--) {  // 2018-01-23: search backwards in time.
      Psy[i].psyExam(); // 2018-01-23: inspect the Psy concept flag-panel
      if (psi1==qv1psi) {  // 2018-06-16: if correct subject
        aud = psi14;  // 2018-01-23: fetch auditory recall tag for Speech()
        Speech();  // 2018-01-23: speak the answer concept, thus activating it.
        break;  // 2018-01-23: one utterance is enough.
      }  // 2018-01-23: end of test for subject answer-concept
    }  // 2018-01-23:  end of (for loop) searching for the subject answer-concept.
    for (i=tpu; i>midway; i--) {  // 2018-01-23: search backwards in time.
      Psy[i].psyExam(); // 2018-01-23: inspect the Psy concept flag-panel
      if (psi1==qv1psi && psi12==qv4psi) {  // 2018-01-23: subj. with dir.obj.
        psi3 = (psi3 + 64);  // 2018-01-23: impose an overriding activation.
        Psy[i] = new  // 2018-01-23: inserting [psi3]act with higher activation:
  psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
      }  // 2018-01-23: end of test for subject answer-concept
    }  // 2018-01-23: end of (for loop) searching for the subject answer-concept.
    qvdocon = 0;  // 2018-06-16: reset for safety.
    return;  // 2018-06-05: skip the remainder of SpreadAct()
  }  // 2018-01-23: end of test for who+verb+direct-object query condition.

  if (qviocon > 0) {  // 2018-01-23: prepare for indirect-object queries...
//   alert("SpreadAct has been called.");  // 2018-01-23: for future implementation
  }   // 2018-01-23: end of test for who+verb+indirect-object query condition.

  if (hlc != "ru") {  // 2018-01-20: English by default, but for any language.
    if (nucon > 0) {  // 2018-01-23: if there is a new-concept condition...
      moot = 1;  // 2018-01-23: prevent associative tags within question.
      output = "";  // 2018-01-23: clear the display of output.
      for (i=tpu; i>midway; i--) {  // 2018-01-23: search backwards in time.
        Psy[i].psyExam(); // 2018-01-23: inspect the Psy concept flag-panel
        if (psi1 == 781 && psi13 == 0) {  // 2018-01-23: WHAT without verblock.
          aud = psi14;  // 2018-01-23: fetch auditory recall tag for Speech()
          Speech();  // 2018-01-23: speak the 781=WHAT
          break;  // 2018-01-23: one utterance is enough.
        }  // 2018-01-23: end of test for 781=WHAT with no overriding verblock.
      }  // 2018-01-23: end of (for loop) searching for 781=WHAT concept.
//    if (endpho == "S") qusubnum = 2;  // 2018-10-14: assume plural if "-S"
      if (b16 == "S") qusubnum = 2;  // 2018-10-14: if "-S" in OutBuffer
      for (i=vault; i>midway; i--) {  // 2018-01-23: search backwards in "vault"
        Psy[i].psyExam(); // 2018-01-23: inspect the Psy concept flag-panel
        if (qusubnum == 0) qusubnum = 1;  // 2018-10-03: default to singular.
        if (psi1==800 && psi7==3 && psi8==qusubnum) {  // 2018-10-03
          aud = psi14;  // 2018-01-23: fetch auditory recall tag for Speech()
          Speech();  // 2018-01-23: speak the 800=BE
          break;  // 2018-01-23: one utterance is enough.
        }  // 2018-01-23: end of test for 800=BE
      }  // 2018-01-23: end of (for loop) searching for correct form of 800=BE.
      for (i=t; i>midway; i--) {    // 2018-10-03: must include new input.
        Psy[i].psyExam(); // 2018-01-23: inspect the Psy concept flag-panel
        if (psi1 == qusub) {  // 2018-01-23: look for the new concept.
          aud = psi14;  // 2018-01-23: fetch auditory recall tag for Speech()
          Speech();  // 2018-01-23: speak the new concept
          qusub = 0;  // 2018-06-11: reset for safety.
          break;  // 2018-01-23: one utterance is enough.
        }  // 2018-01-23: end of test for engram of new concept.
      }  // 2018-01-23: end of (for loop) searching for the new concept.
      Voice();  // 2018-09-21: makes the question appear on-screen.
      moot = 0;  // 2018-01-23: finish preventing associative tags within question.
      return;  // 2018-06-05: skip the remainder of SpreadAct()
    }  // 2018-01-23: end of test of nucon so as to cause asking of a question.
  }  // 2018-01-23: end of English by default while preserving option of language.

  if (actpsi > 0 && qucon == 0) {  // 2018-01-12: not with who-queries
    for (i=tpu; i>midway; --i) {  // 2018-01-12: search backward from tpu
      Psy[i].psyExam(); // 2018-01-12: examine the Psy concept array...
      if (psi1 == actpsi && psi12 > 0) seqpsi = psi12; // 2018-01-12: if seq, seqpsi
      if (psi1 ==  actpsi && psi13 > 0) {  // 2018-01-12: require verblock.
        psi3 = (psi3 + 64);  // 2018-06-03: impose plenty of activation.
        Psy[i] = new  // 2018-06-11: moving "new" up from next line:
psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
      } // 2018-01-12: end of test requiring tkb verblock.
    }  // 2018-01-12: end of (for loop) searching for actpsi concept.
  }  // 2018-01-12: end of test for a positive actpsi.
  qvdocon = 0;  // 2018-06-16: reset for safety.
}  // 2018-10-02: SpreadAct() returns to Sensorium() or to....


function EnPrep() {  // http://ai.neocities.org/EnPrep.html
  for (i = t; i>midway; --i) {  // 2018-10-28: Loop backwards in recent time.
    Psy[i].psyExam();  // 2018-10-28: Examine the Psy concept-array.
    if (psi6==6 && psi10==qv2psi) {  // 2018-10-28: check for pos=prep and pre=quverb
      tselp = i;  // 2018-10-28: time of selection of preposition
      prep = psi1;  // 2018-10-28: for _any_ preposition
      objprep = psi12;  // 2018-10-28: turn "seq" into object-of-preposition
    }  // 2018-10-28: end of test for _any_ preposition linkwd to "quverb".
//  if (tselp > 0 && psi1==qv2psi && ((tselp - i) < 32)) {  // 2018-10-28:
//  }  // 2018-10-28: end of test for quverb occurring close to preposition.
    if (tselp > 0 && psi1==qusub && psi12==quverb && ((tselp - i) < 32)) {  // 2018-10-28:
      psi3 = 128;  // 2018-11-13: increment the activation of the query-subject
      Psy[i] = new
psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
      break;  // 2018-10-28: exit the loop upon finding and activating query-subject.
    }  // 2018-10-28: end of test for qusub occurring close to preposition.
  } // 2018-10-28: end of backwards loop.
  for (i=tpu; i>midway; i--) {  // 2018-10-28: search Psy array
    Psy[i].psyExam(); // 2018-10-28: inspect the Psy concept flag-panel
    if (psi1 == prep) {  // 2018-10-28: if preposition is found;
      aud = psi14;  // 2018-10-28: recall-vector for Speech()
      break;  // 2018-10-28: one auditory engram is enough.
    }  // 2018-10-28: End of search for preposition
  }  // 2018-10-28: end of loop searching for preposition
  Speech();  // 2018-10-28: speak the preposition
  EnArticle();  // 2018-10-28: say "A" or "THE" before object of [preposition.
  for (i=tpu; i>midway; i--) {  // 2018-10-28: search Psy array
    Psy[i].psyExam(); // 2018-10-28: inspect the Psy concept flag-panel
    if (psi1 == objprep) {  // 2018-10-28: if object of preposition is found;
      aud = psi14;  // 2018-10-28: recall-vector for Speech()
      break;  // 2018-10-28: one auditory engram is enough.
    }  // 2018-10-28: End of search for object of preposition
  }  // 2018-10-28: end of loop searching for object of preposition
  Speech();  // 2018-10-28: speak the object of preposition
  prepgen = 0;  // 2018-10-26: reset to avoid carry-over.
  wherecon = 0;  // 2018-10-28: reset to avoid carry-over.
}  // End of EnPrep(); return to EnVerbPhrase();


function EnAuxVerb() {  // http://ai.neocities.org/EnAuxverb.html
 tdo = 0;  // 2018-07-12: prevent carry-over.
 if (auxverb==830) {  // 2018-01-26: 830=DO;
  if (subjnum == 1 && prsn == 1) {  // 2018-01-26: first person singular?
    for (i = vault; i>midway; i--) {  // 2018-01-26: "vault" is reliable.
      Psy[i].psyExam(); //  2018-01-26: examine conceptual Psy array;
      if (psi1==830 && psi8==1 && psi7==1) {  // 2018-01-26: 830=DO;
        aud = psi14;  // 2018-01-26: auditory recall-vector;
        break;  // 2018-01-26: one example is enough.
      }  // 2018-01-26: end of test for singular #830=DO;
    }  // 2018-01-26: end of backwards loop;
    Speech();  // 2018-01-26:
  }  // 2018-01-26: end of test for 1st person singular;
  if (subjnum == 1 && prsn == 2) {  // 2018-01-26: second person singular?
    for (i = vault; i>midway; i--) {  // 2018-01-26: "vault" is reliable.
      Psy[i].psyExam(); //  2018-01-26: examine conceptual Psy array;
      if (psi1==830 && psi8==1 && psi7==2) {  // 2018-01-26: 830=DO;
        aud = psi14;  // 2018-01-26: auditory recall-vector;
        break;  // 2018-01-26:
      }  // 2018-01-26: end of test for singul;ar 830=DO;
    }  // 2018-01-26: end of backwards loop;
    Speech();  // 2018-01-26:
  }  // 2018-01-26: end of test for 2nd person singular;
  if (subjnum == 1 && prsn == 3) {  // 2018-01-26: singular num(ber)?
    for (i = vault; i>midway; i--) {  // 2018-01-26: "vault" is reliable.
      Psy[i].psyExam(); //  2018-01-26: examine conceptual Psy array;
      if (psi1==830 && psi8==1 && psi7==3) {  // 2018-01-27: 830=DO;
        aud = psi14;  // 2018-01-26: auditory recall-vector;
        break;  // 2018-01-26:
      }  // 2018-01-26: end of test for 830=DOES;
    }  // 2018-01-26: end of backwards loop;
    Speech();  // 2018-01-26
  }  // 2018-01-26: end of test for 3rd person singular;
  if (subjnum == 2 && prsn == 1) {  // 2018-01-26: plural num(ber)?
    for (i = vault; i>midway; i--) {  // 2018-01-26: "vault" is reliable.
      Psy[i].psyExam(); //  2018-01-26: examine conceptual Psy array;
      if (psi1==830 && psi8==2 && psi7==1) {  // 2018-01-26: 830=DO;
        aud = psi14;  // 2018i-01-26: auditory recall-vector;
        break;  // 2018-01-26:
      }  // 2018-01-26: end of test for plural 830=DO;
    }  // 2018-01-26: end of backwards loop;
    Speech();  // 2018-01-26:
  }  // 2018-01-26: end of test for 1st person plural;
  if (subjnum == 2 && prsn == 2) {  // 2018-01-26: plural num(ber)?
    for (i = vault; i>midway; i--) {  // 2018-01-26: "vault" is reliable.
      Psy[i].psyExam(); //  2018-01-26: examine conceptual Psy array;
      if (psi==830 && psi8==2 && psi7==2) {  // 2018-01-26: 830=DO;
        aud = psi14;  // 2018-02-04: auditory recall-vector;
        break;  // 2018-01-26:
      }  // 2018-01-26: end of test for plural 830=DO;
    }  // 2018-01-26: end of backwards loop;
    Speech();  // 2018-01-26:
  }  // 2018-01-26: end of test for 2nd person plural;
  if (subjnum == 2 && prsn == 3) {  // 2018-01-26: plural num(ber)?
    for (i = vault; i>midway; i--) {  // 2018-01-26: "vault" is reliable.
      Psy[i].psyExam(); //  2018-01-26: examine conceptual Psy array;
      if (psi1==830 && psi8==2 && psi7==3) {  // 2018-01-26: 830=DO;
        aud = psi14;  // 2018-01-26: auditory recall-vector;
        break;  // 2018-01-26:
      }  // 2018-01-26: end of test for plural 830=DO;
    }  // 2018-01-26: end of backwards loop;
    Speech();  // 2018-01-26:
  }  // 2018-01-26: end of test for 3rd person plural;
 }  // 2018-01-26: end of test for 830=DO auxiliary verb;
// prsn = 0;  // after auxiliary prevent verb-inflection; 17jun2015
// verbprsn = 0;  // after auxiliary use infinitive verb-form; 17jun2015
 infincon = 1;  // 2018-01-26: after auxiliary set infinitive condition;
}  // End of EnAuxVerb(); return to EnVerbPhrase(O) or AskUser()


function AskUser() {  // http://ai.neocities.org/AskUser.html
  output = "";  // 2018-01-27: blank out previous output before question;
  pov = 1;  // 2018-01-25: 1=internal; 2=external;
  tdo = 0;  // 2018-07-12: prevent carry-over.
  quobjaud = 0;  // 2018-01-26: safety measure;
  if (posflag==7 || posflag==5) {  // 2018-01-26: noun or pronoun;
  }  // 2018-01-26: end of test of posflag;
  if (ynverb == 0) {  // 2018-01-26: ask y/n question only once;
    ynverb = quverb;  // 2018-01-26: isolate at start;
    moot = 1;  // 2018-01-26: prevent storing of "tkb" and "seq";
    auxverb = 830;  // 2018-01-26: 830=DO as auxiliary verb;
    prsn = 3;  // 2018-10-03: assumption based on Is-A status.
    EnAuxVerb();  // 2018-01-26: Say 830=DO or DOES;
    auxverb = 0;  // 2018-01-26: reset for safety;
    moot = 0;  // 2018-01-26: reset after use;
   for (i = inft; i>midway; i--) {  // 2018-01-26: skip silent inference;
      Psy[i].psyExam();  // 2018-01-25: examine conceptual Psy array;
      if (psi1 == qusub) {  // 2018-01-25: if query-subject found;
        aud = psi14;  // 2018-01-25: assign auditory recall-tag;
        break;  // 2018-01-25: exit the loop after first find;
      }  // 2018-01-26: end of test for query-subject;
    }  // 2018-01-26: end of loop in search of qusub;
    Speech();  // 2018-01-25: say subject-word starting at "aud" value;

    if (quverb == 0) quverb = 830;  // 2018-01-25: 830=DO default;
    for (i = inft; i>midway; i--) {  // 2018-01-25: skip silent inference;
      Psy[i].psyExam();  // 2018-01-25: examine Psy conceptual array;
//    if (psi1 == quverb) {  // 2018-01-25: if yn query-verb found;
      if (psi1 == quverb && psi7==0) {  // 2018-10-04: infinitive dba=0
        aud = psi14;  // 2018-01-25: assign most recent recall-tag;
        break;  // 2018-01-25: exit the loop after first find;
      }  // 2018-01-25: end of test for quverb;
    }  // 2018-01-25: end of loop in search of yes-or-no ("yn") quverb;
    verbprsn = 0;  // 2018-01-25: Store the verb as an infinitive form;
    audnum = 0;  // 2018-01-25: infinitive without num(ber);
    holdnum = 0;  // 2018-01-25: infinitive without num(ber);
    infincon = 1;  // 2018-01-25: set flag to positive one;
    nphrnum = 0;  // 2018-01-25: for no influence on infinitive;
    numsubj = 0;  // 2018-01-25: for no influence on infinitive;
    putnum = 0;   // 2018-01-25: for insisting on zero num infinitive;
    Speech();  // 2018-01-25: speak the verb starting at "aud" value;
    if (quobj == 0) quobj = 711;  // 2018-01-25: 711=ANYTHING default;
    for (i = inft; i>midway; i--) {  // 2018-01-25: skip silent inference;
     Psy[i].psyExam();  // 2018-01-25: examine Psy conceptual array;
      if (psi1 == quobj) {  // 2018-01-25: if query-object found;
        if (psi7==4) {  // 2018-01-25: dba=4 accusative?
          quobjaud = psi14;  // 2018-01-25: hold thru EnArticle();
          EnArticle();  // from German AI; insert "A" or "THE"? 20mar2013
          aud = quobjaud;   // 2018-01-25: restore after EnArticle;
          break; // 2018-01-25: exit the loop after first grammatical find;
        }  // 2018-01-25: end of test for accusative dba=4;
      }  // 2018-01-25: end of test for quobj;
    }  // 2018-01-25: end of loop in search of quobj;
    dirobj = 1;  // 2018-01-25: So OldConcept will set "dba" = 4 (accusative)
    Speech();    // 2018-01-25: say object word starting at "aud" value;
    dirobj = 0;  // 2018-01-25: Reset for safety after asking question;
    yncon = 0;   // 2018-01-25: because question has been asked;
    kbcon = 1;   // 2018-01-25: because waiting for answer;
    ynverb = 0;  // 2018-01-25: zero out; prevent repeat of query;
  }  // 2018-01-25: end of test of ynverb;
  if (subjpsi==701) prsn=1; // 2018-01-25: 1st person "I";
  if (subjpsi==731) prsn=1; // 2018-01-25: 1st person "WE";
  if (subjpsi==707) prsn=2; // 2018-01-25: 2nd person YOU;
  if (subjpsi==713) prsn=3; // 2018-01-25: 3rd person HE;
  if (subjpsi==719) prsn=3; // 2018-01-25: 3rd person SHE;
  if (subjpsi==725) prsn=3; // 2018-01-25: 3rd person IT;
  if (subjpsi==743) prsn=3; // 2018-01-25: 3rd person THEY;
  numsubj = 0;  // 2018-01-25: reset for safety;
  qusnum = 0;  // 2018-01-25: reset for safety;
  qusub = 0;   // 2018-06-11: reset for safety;
  recon = 0;  // 2018-01-25:
  bias = 5;  // 2018-01-25: restore expectation of a noun;
  for (i = idle; i<1000; i++) {  // 2018-01-27: delay for user to see question?
    if (i > 1) { apb = "Pausing briefly for your answer..."; Voice() }  // 2018-01-27
  }  // 2018-01-27: end of delay
}  // 2018-01-25: AskUser() returns to EnThink()


function EnNounPhrase() {  // http://ai.neocities.org/EnNounPhrase.html
  act = 0; // 2018-01-12: so comparisons may be higher.
  audjuste = 0;  // 2018-01-12: prevent carry-over
  defact = -64;  // 2018-01-12: for default comparisons with "701=I";
  motjuste = 0;   // 2018-01-12:
  nphrnum = 0;   // 2018-09-05: prevent carry-over of previous value.
  nphrpos = 5;   // 2018-01-12: a default setting of noun for EnArticle().
  subjpsi = 0;   // 2018-01-12: how can there already be a subject-psi? TEST
  tsels = 0;     // 2018-01-12: time of selection of subject
  if (whatcon > 0) verblock = 0;  // 2018-06-03: if answering what-query...
  if (wherecon > 0) verblock = 0;  // 2018-10-28: if answering where-query...
  if (verblock > 0) {  // 2018-01-12: positive verblock?
    Psy[verblock].psyExam(); // 2018-01-12: expose all values during search.
    nounlock = psi13;  // 2018-06-03 BUGFIX: time-point of "tkb" engram;
    subjnum = psi8;  // 2018-01-11: from number of verb;
  }  // 2018-01-12:  end of test for a positive verblock
  if (nounlock > 0) {  // 2018-01-12: already a nounlock?
    dirobj = 1;  // 2018-01-12: nounlock is specifically for a direct object.
    subjectflag = 0;  // 2018--1-12: needed for conditional tests;
    Psy[nounlock].psyExam(); // 2018-01-12: inspect t=nounlock row;
    motjuste = psi1;  // 2018-01-12: in case a search is needed for non-zero rv
    nphrnum = psi8;   // 2018-09-05: for sake of EnArticle() etc.
    if (quiet == true) actpsi = psi1;  // 2018-06-11: so EnVerbPhrase() calls SpreadAct()
    nphrpos = psi6;  // 2018-05-26: find part-of-speech for EnArticle
    if (psi6==5) objnum = psi8;  // 2018-06-16: use only for 5=noun.
    if (psi7 == 4) {  // 2018-01-12: if dba is acc. case as for any nounlock;
      if (psi14 > 0) {  // 2018-01-12: if there is a positive recall-vector...
        nphrpos = psi6;  // 2018-01-12: find part-of-speech for EnArticle
        nphrnum = psi8;  // 2018-09-05: noun-phrase num(ber) for EnArticle()
        aud = psi14;  // 2018-01-12: find positive rv;
      } else {  // 2018-01-13: if only a zero rv psi14 is found...
        for (i = tpu; i>midway; --i) {  // 2018-01-12: search backwards
          Psy[i].psyExam(); // 2018-01-12: inspect each time-point "i"
          if (motjuste == psi1) {  // 2018-01-12: find motjuste for sake of rv
            if (subjectflag == 1 && psi7 == 1) {  // 2018-01-12: dba subject?
              if (psi14 > 0) aud = psi14;  // 2018-01-12: find positive rv;
              break;  // 2018-01-14: exit loop after first find;
            } // 2018-01-12: end of test for subject
          }  // 2018-01-12: end of test for same concept as motjuste
          if (dirobj == 1 && psi7 == 4) { // 2018-01-12: dba direct object?
            if (psi14 > 0) nphrpos = psi6;  // 2018-01-13: for EnArticle.
            if (psi14 > 0) nphrnum = psi8;  // 2018-09-05: for EnArticle.
            if (psi14 > 0) aud = psi14;  // 2018-01-12: find positive rv;
            if (psi14 > 0) break;  // 2018-01-14: exit loop if rv is found.
          }  // 2018-01-12: end of test for direct object and accusative case.
          if (psi14 > 0)  nphrpos = psi6;  // 2018-01-12: for EnArticle.
          if (psi14 > 0) aud = psi14;  // 2018-01-12: find positive rv;
          if (psi14 > 0) break;  // 2018-01-14: exit loop if rv is found.
        }  // 2018-01-12: end of for-loop in search of a positive recall-vector.
      }  // 2018-01-12: end of else-clause for typically a pronominal rv.
    }  // 2018-01-12: end of dba-test for accusative nounlock.
  }  // 2018-01-12: end of test for a positive nounlock;
  snu = 1;  // 2018-10-10: TEST; REMOVE
  if (nounlock == 0) {  // 2016apr16: if nouns are free to compete...
    subjectflag = 1;  // 2018-01-12: a default until countermanded.
    dba = 1;  // 2018-01-12: default nominative until countermanded.
    if (dirobj == 1) subjectflag = 0;  // 2018-01-12: countermanding default
    for (i = t; i>midway; --i) {  // 2018-01-12: include input for topical response
      Psy[i].psyExam(); // 2018-01-12: inspect each time-point "i"
      if (psi6==5 || psi6==7) {  // 2018-01-12: select "pos" noun or pronoun
        if (whatcon==1 && psi1==qv1psi && psi14>0 && qv2psi==840) {  // 2018-05-13: WHAT...THINK?
          svo1 = psi1;  // 2018-05-13: keep track of subject.
          tsels = i;  // 2018-05-13: use time-point of subj-selection  for inhibition.
          subjnum = psi8;  // 2018-10-03: for sake of EnAuxVerb()
          aud = psi14; // 2018-05-13: temporary recall-vector for Speech
          Psy[i] = new
 psyNode(psi0,psi1,psi2,256,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
          break;  // 2018-05-13: abandon search.
        }  // 2018-05-13: end of test for WHAT...THINK query.
        if (psi13 > 0 ) {  // 2018-01-12: retrieve ideas, not single words.
          if (psi3 > act) {  // 2018-01-12: psi3 activation as criterion.
            motjuste = psi1;  // 2018-01-12: Select the most active concept.
            svo1 = psi1;  // 2018-01-12: keep track of subject.
            mjact = psi3;  // 2018-01-12: if too low, motjuste defaults to "I"
            posflag = psi5;  // 2018-01-27: AskUser discriminand;
//          snu = psi8;      // 2018-10-10: for sake of EnVerbGen()
            if (psi8 > 0) snu = psi8;  // 2018-10-10: for sake of EnVerbGen()
            subjnum = psi8;  // 2018-10-03: for sake of EnAuxVerb()
            if (psi3 > act && psi12 > 0) {  // 20198-01-12: if psi1 has psi12-seq
              verblock = psi13;  // 2018-01-12: assign tkb value to verblock.
//            snu = psi8;      // 2018-10-10: for sake of EnVerbGen()
              if (psi8 > 0) snu = psi8;  // 2018-10-10: for sake of EnVerbGen()
              subjnum = psi8;  // 2018-01-27: for AuxVerb DOES or DO;
            } // 2018-01-12: end of test for a psi1-subject with a psi12-seq.
            if (psi3 > act && psi13 > 0) { // 2018-01-12: if psi1 has psi13-tkb
              verblock = psi13;  // 2018-01-12: assign tkb value to verblock.
//            snu = psi8;      // 2018-10-10: for sake of EnVerbGen()
              if (psi8 > 0) snu = psi8;  // 2018-10-10: for sake of EnVerbGen()
              subjnum = psi8;  // 2018-01-27: for AuxVerb DOES or DO;
            }  // 2018-01-12: end of test for a psi1-subject with a psi13-tkb.
            if (dirobj == 1) actpsi = psi1;  // 2018-01-12:
            subjpsi = motjuste;  // 2018-01-12: for selection of verb-form.
            nphrnum = psi8;  // 2018-09-05: NounPhrase number for EnArticle() etc.
            snu = psi8;  // 2018-01-12: subject-number for verb-selection;
            if (psi14 > 0 && numreq==0) {  // 2018-05-25: if positive recall-vector...
              nphrpos = psi6;  // 2018-01-12: for sake of EnArticle.
              aud = psi14; // 2018-06-11: temporary recall-vector for Speech
            }  // 2018-01-12: end of test for auditory-engram recall-vector.
            if (psi14 > 0 && numreq > 0 && psi8==numreq) {  // 2018-05-25:
              nphrpos = psi6;  // 2018-05-25: for sake of EnArticle.
              aud = psi14; // 2018-06-11: temporary recall-vector for Speech
            }  // 2018-05-25: end of test for auditory-engram recall-vector.
            tseln = i;  // 2018-01-12: use time-point for inhibition.
            tsels = i;  // 2018-01-12: use time-point for inhibition.
            act = psi3;  // 2018-01-12: noun must have higher "act" to win
          }  // 2018-01-12: end of test for a higher activation "act"
        }  // 2018-01-12: end of test for a psi13 "tkb" verblock.
      }  // 2018-01-12: end of test for noun or pronoun as subject
    }  // 2018-01-12: End of (for loop) searching for most active "motjuste"
  } // 2018-01-12: end of test for absence of a nounlock.
  Psy[tsels].psyExam(); // 2018-05-28: inspect subject to be inhibited.
  snu = psi8;  // 2018-10-10: for sake of EnVerbGen()
  psi3 = (psi3 - 90);  // 2018-05-13: make activation relative, not absolute.
  Psy[tsels] = new
psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
  if (subjectflag == 0) {  // 2018-01-12: i.e., dir.obj or pred.nom;
    if (nounlock > 0) {  // 2018-01-12: if verb is locked to a particular seq...
      Psy[nounlock].psyExam(); // 2018-01-12: inspect t=nounlock row;
      motjuste = psi1;  // 2018-01-12: nounlock psi pre-empts search.
      if (psi6 == 5) {  // 2018-01-12: if nounlock part of speech is 5=noun
        nphrpos = 5;  // 2018-01-12: for sake of EnArticle.
        qv1psi = psi1;  // 2018-01-12: let direct object go to SpreadAct.
      }  // 2018-01-12: end of test for only a noun to go into SpreadAct.
      aud = psi14;  // 2018-01-12: psi14 recall-vector to auditory engram.
    }  // 2018-01-12: end of test for a positive nounlock.
    if (aud == 0) {  // 2018-05-28: for instance, switching ME and YOU
      for (i = tpu; i>midway; --i) {  // 2018-05-28: search backwards from tpu
        Psy[i].psyExam(); // 2018-05-28: inspect Psy flag-panel
        if (motjuste == psi1) {  // 2018-01-12: find motjuste for sake of rv
          if (subjectflag == 1 && psi7 == 1) {  // 2018-01-12: subject?
            if (psi14 > 0) aud = psi14;  // 2018-01-12: find positive rv;
            if (psi14 > 0) break;  // 2018-01-12: exit loop if rv is found.
          } // 2018-01-12: end of test for subject and for nominative case.
          if (dirobj == 1 && psi7 == 4) {  // 2018-05-28: direct object?
            if (psi1 > 0) qv4psi = psi1;  // 2018-05-28: for inserting "AN".
            if (psi1 > 0) nphrpos = psi6; // 2018-05-28: set POS for EnArticle.
            if (psi1 > 0) aud = psi14;  // 2018-05-28: find positive rv;
            if (psi14 > 0) break;  // 2018-05-28: exit loop if rv is found.
          }  // 2018-05-28: end of test for direct object and accusative case.
        }  // 2018-06-09: BUGFIX: missing end of if-clause.
      } // 2018-05-28: end of for-loop searching for rv.
    }  // 2018-05-28: end of test for missing "aud" recall-vector.
  }  // 2018-01-12: end of test for not-a-subject
  for (i = tpu; i>midway; --i) {  // 2018-01-12: search backwards from tpu
    Psy[i].psyExam(); // 2018-01-12: inspect Psy flag-panel
    if (motjuste == psi1) {  // 2018-01-12: find motjuste for sake of rv
      if (subjectflag == 1 && psi7 == 1) {  // 2018-01-12: subject?
        if (psi14 > 0) aud = psi14;  // 2018-01-12: find positive rv;
        if (psi14 > 0) break;  // 2018-01-12: exit loop if rv is found.
      } // 2018-01-12: end of test for subject and for nominative case.
      if (dirobj==1 && numreq>0 && psi8==numreq) {  // 2018-05-25:
        if (psi1 > 0) qv4psi = psi1;  // 2018-05-25: for inserting "AN".
        if (psi1 > 0) nphrpos = psi6; // 2018-05-25: set POS for EnArticle.
        if (psi1 > 0) aud = psi14;  // 2018-05-25: find positive rv;
        if (psi14 > 0) break;  // 2018-05-25: exit loop if rv is found.
      }  // 2018-05-25: end for pseud-dir=obj and numreq number.
      if (dirobj == 1 && psi8 == numreq && numreq>0) {  // 2018-05-25: required number?
        if (psi1 > 0) qv4psi = psi1;  // 2018-05-25: for inserting "AN".
        if (psi1 > 0) nphrpos = psi6; // 2018-05-25: set POS for EnArticle.
        if (psi1 > 0) aud = psi14;  // 2018-05-25: find positive rv;
        if (psi14 > 0) break;  // 2018-05-25: exit loop if rv is found.
      }  // 2018-05-25: end of test for direct object and accusative case.
      if (dirobj == 1 && numreq > 0) {  // 2018-05-25: direct object?
        if (psi1 > 0) qv4psi = psi1;  // 2018-05-25: for inserting "AN".
        if (psi1 > 0) nphrpos = psi6; // 2018-05-25: set POS for EnArticle.
        break;  // 2018-05-25: exit loop if rv is found.
        if (psi1 > 0 && psi8==numreq && psi14>0) { // 2018-05-25
          aud = psi14;  // 2018-05-25: find positive rv;
          break;  // 2018-05-25: exit loop if rv is found.
        }  // 2018-05-25:
      if (psi1 > 0 && psi8==numreq && psi14>0) break; // 2018-05-25: TEST
      }  // 2018-05-25: end of test for direct object and accusative case.
      if (psi1 > 0 && psi8==numreq && psi14>0) break; // 2018-05-25: TEST
      if (dirobj == 1 && psi7 == 4) {  // 2018-01-12: direct object?
        if (psi1 > 0) qv4psi = psi1;  // 2018-01-12: for inserting "AN".
        if (psi1 > 0) nphrpos = psi6; // 2018-01-12: set POS for EnArticle.
        if (psi1 > 0) aud = psi14;  // 2018-01-12: find positive rv;
        if (psi14 > 0) break;  // 2018-01-12: exit loop if rv is found.
      }  // 2018-01-12: end of test for direct object and accusative case.
    }  // 2018-01-12: end of test to find motjuste with valid rv.
  } // 2018-01-14: end of for-loop as part of else-clause.
  for (i=vault; i>midway; --i) {  // 2018-01-23: search backwards within "vault"
    Psy[i].psyExam(); // 2018-01-23: examine the Psy concept array...
    if (numreq > 0 && aud > 0);  break;  // 2018-05-25: pre-empt
    if (motjuste == psi1) {  // 2018-01-23: find motjuste for sake of rv
      if (numreq>0 && psi8==numreq && psi14>0) {  // 2018-05-25:
        aud = psi14;  // 2018-05-25:
        break;  // 2018-05-25:
      }  // end of test to preempt with numreq
      if (subjectflag == 1 && psi7 == 1) {  // 2018-01-23: subject?
        if (psi14 > 0) aud = psi14;  // 2018-01-23: find positive rv;
        if (psi14 > 0) break;  // 2018-01-23: exit loop if rv is found.
      }  // 2018-01-23: end of test for subject and for nominative case.
      if (dirobj == 1 && psi7 == 4) {  // 2018-01-23: direct object?
        if (psi1 > 0) qv4psi = psi1;  // 2018-01-23: for inserting "AN".
        if (psi14 > 0) nphrpos = psi6;  // 2018-01-23: set POS for EnArticle.
        if (psi14 > 0) aud = psi14;  // 2018-01-23: find positive rv;
        if (psi14 > 0) break;  // 2018-01-23: exit loop if rv is found.
      }  // 2018-01-23: end of test for direct object and accusative case.
    }  // 2018-01-23: end of test to find motjuste with valid rv.
  }  // 2018-01-23: End of (for loop) searching through Psy conceptual array.
  if (nounlock == 0) {  // 2018-01-12: if no nounlock override;
    if (mjact < 20) {  // 2018-01-12: if no subject active enough for chain-of-thought
      if (subjectflag == 1) {  // 2018-01-12: default to "I" only as subject
        motjuste = 701;  // 2018-01-12: 701=I default concept of AI Mind
        for (i = tpu; i>midway; --i) {  // 2018-01-12: search backwards
          Psy[i].psyExam(); // 2018-01-12: inspect Psy flag-panel
          if (psi1==701 && psi13 > 0) {  // 2018-01-12: I=701 with tkb verblock?
            if (psi3 > defact) {  // 2018-01-12: if higher psi3 act is found;
              tseln = i;  // 2018-01-12: retain time of motjuste;
              tsels = i;  // 2018-01-12: retain time of English subject;
              defact = psi3;  // 2018-01-12: dynamic metric;
              verblock = psi13; // 2018-01-12: psi13 tkb as verblock;
              aud = psi14;  // 2018-01-12: recall-vector for auditory engram
            } // 2018-01-12: end of test for higher-act ego-concept;
          }  // 2018-01-12:  end of test for "701=I" with seq-check;
        }  // 2018-01-12: end of search for least-inhibited "701=I";
        dba = 1; // 2018-01-12: subject requires nominative case;
        nphrnum = 1;  // 2018-01-12: for EnArticle() and EnVerbPhrase();
        nphrpos = 7;  // 2018-01-12: prevent article "A" with "I";
        prsn = 1;     // 2018-01-12: for use elsewhere;
        subjnum = 1;  // 2018-01-12: for use elsewhere;
        subjpsi = 701; // 2018-01-12: for use elsewhere;
        topic = 701;   // 2018-01-12: for question-asking modules;
        for (i = vault; i>midway; --i) {  // 2018-01-12: search backwards
          Psy[i].psyExam(); // 2018-01-12: inspect Psy flag-panel
          if (psi1 == 701) {  // 2018-01-12: if 701=I is found;
            if (psi7 == 1) {  // 2018-01-12: psi7/dba must be nominative=1;
              aud = psi14;  // 2018-01-12: "I" recall-vector for Speech()
              if (psi14>0) break;  // 2018-01-14: insurance
            }  // 2018-01-12: end of test for nominative "I";
          }  // 2018-01-12: End of search for 701=I;
        }  // 2018-01-12: end of 701=I search in reliable "vault" sequence.
      } // 2018-01-12: end of test for "I" to become subj. not obj.
    }  // 2018-01-12: end of test for low activation warranting a default
  }  // 2018-01-12: end of test for absence of pre-ordained nounlock;
  unk = aud;  // 2018-01-14: preserve value across call to EnArticle().
  if (nphrpos == 5) {  // 2018-01-14: only nouns, not adjectives or pronouns.
    audMemory[aud].audExam();  // 2018-01-14: Inspect memory at "aud";
    if (aud0 == "A") anset = 65;  // 2018-01-14: If vowel "A";
    if (aud0 == "E") anset = 69;  // 2018-01-14: If vowel "E";
    if (aud0 == "I") anset = 73;  // 2018-01-14: If vowel "I";
    if (aud0 == "O") anset = 79;  // 2018-01-14: If vowel "O";
    if (aud0 == "U") anset = 85;  // 2018-01-14: If vowel "U";
    if (nphrnum > 0) usx = motjuste;  // 2018-09-07: num(ber) required.
    EnArticle();  // 2018-01-14: module for thinking an English article.
    anset = 0;  // 2018-06-03: reset for safety.
    usx = 0;    // 2018-09-04: reset for safety.
  }  // 2018-01-14: end of test for a 5=noun noun-phrase part-of-speech
  aud = unk; // 2018-01-14: restore value after call to EnArticle().
  unk = 0;   // 2018-01-14: reset for safety.
  Speech();  // 2018-01-12: speak the word starting at the "aud" time.
  Psy[tsels].psyExam(); // 2018-01-14: inhibit the subject just spoken:
  Psy[tsels] = new
 psyNode(psi0,psi1,psi2,-32,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
  dirobj = 0;  // 2018-01-12: reset for safety
  mjact = 0;   // 2018-01-12: reset for safety.
  motjuste = 0;  // 2018-01-12: reset for safety.
  numreq= 0;  // 2018-05-25: whether used or not in one pass through the module.
}  // 2018-01-12: EnNounPhrase() returns to Indicative().


function EnVerbGen() {  // http://ai.neocities.org/EnVerbgen.html
  if (audbase == 0 && verbpsi > 0) {  // 2018-10-11: for lack of starting point..
    for (i = tpu; i>midway; --i) {  // 2018-10-11: search backwards
      Psy[i].psyExam(); //  2018-10-11: examine conceptual Psy array at each "i(ndex)"
      if (psi1 == verbpsi && psi14 > 0) {  // 2018-10-11: verb with recall-vectoer?
        audbase = psi14;  // 2018-10-11: initial base-time for generating verb-form
        break;  // 2018-10-11: one example is enough.
      }  // 2018-10-11: end of test for modificand verb and auditory engram
    }  // 2018-10-11: end of backwards loop in search of audbase starting point.
  }  // 2018-10-11: end of search for "audbase" starting point.
  binc = 0;  // 2018-10-12: "b" buffer-character increment for AudBuffer()
  if (subjpsi==701) prsn = 1;  // 2018-10-11: "701=I" is first-person;
  if (subjpsi==707) prsn = 2;  // 2018-10-11: "707=YOU" is second-person;
  if (subjpsi==713) prsn = 3;  // 2018-10-11: "713=HE" is third-person;
  if (subjpsi==719) prsn = 3;  // 2018-10-11: "719=SHE" is third-person;
  if (subjpsi==725) prsn = 3;  // 2018-10-11: "725=IT" is third-person;
  if (subjpsi==731) prsn = 1;  // 2018-10-11: "731=WE" is first-person;
  if (subjpsi==743) prsn = 3;  // 2018-10-11: "743=THEY" is third-person;
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #01
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #02
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #03
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #04
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #05
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #06
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #07
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #08
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #09
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #10
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #11
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #12
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #13
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #14
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #15
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #16
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  do {  // 2018-10-11: next loop uses OutBuffer();
    OutBuffer();  // 2018-10-11: call OutBuffer with each passage through loop;
    if (binc == 1) {  // 2018-10-11: the indicated buffer-character by number
      if (b01 != "") output += b01;  // 2018-10-11: concatenate verb-characters
      pho = b01;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 2) {  // 2018-10-11: the indicated buffer-character by number
      if (b02 != "") output += b02;  // 2018-10-11: concatenate verb-characters
      pho = b02;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 3) {  // 2018-10-11: the indicated buffer-character by number
      if (b03 != "") output += b03;  // 2018-10-11: concatenate verb-characters
      pho = b03;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 4) {  // 2018-10-11: the indicated buffer-character by number
      if (b04 != "") output += b04;  // 2018-10-11: concatenate verb-characters
      pho = b04;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 5) {  // 2018-10-11: the indicated buffer-character by number
      if (b05 != "") output += b05;  // 2018-10-11: concatenate verb-characters
      pho = b05;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 6) {  // 2018-10-11: the indicated buffer-character by number
      if (b06 != "") output += b06;  // 2018-10-11: concatenate verb-characters
      pho = b06;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 7) {  // 2018-10-11: the indicated buffer-character by number
      if (b07 != "") output += b07;  // 2018-10-11: concatenate verb-characters
      pho = b07;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 8) {  // 2018-10-11: the indicated buffer-character by number
      if (b08 != "") output += b08;  // 2018-10-11: concatenate verb-characters
      pho = b08;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 9) {  // 2018-10-11: the indicated buffer-character by number
      if (b09 != "") output += b09;  // 2018-10-11: concatenate verb-characters
      pho = b09;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 10) {  // 2018-10-11: the indicated buffer-character by number
      if (b10 != "") output += b10;  // 2018-10-11: concatenate verb-characters
      pho = b10;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 11) {  // 2018-10-11: the indicated buffer-character by number
      if (b11 != "") output += b11;  // 2018-10-11: concatenate verb-characters
      pho = b11;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 12) {  // 2018-10-11: the indicated buffer-character by number
      if (b12 != "") output += b12;  // 2018-10-11: concatenate verb-characters
      pho = b12;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 13) {  // 2018-10-11: the indicated buffer-character by number
      if (b13 != "") output += b13;  // 2018-10-11: concatenate verb-characters
      pho = b13;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 14) {  // 2018-10-11: the indicated buffer-character by number
      if (b14 != "") output += b14;  // 2018-10-11: concatenate verb-characters
      pho = b14;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 15) {  // 2018-10-11: the indicated buffer-character by number
      if (b15 != "") output += b15;  // 2018-10-11: concatenate verb-characters
      pho = b15;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 16) {  // 2018-10-11: the indicated buffer-character by number
      if (b16 != "") output += b16;  // 2018-10-11: concatenate verb-characters
      pho = b16;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    binc++;  // 2018-10-11: TEST; REMOVE
    pho = aud0;  // 18oct2012
    abc = aud0;  // for AudBuffer(); 18oct2012
  }  // 2018-10-11: end of looping through OutBuffer().
  while (binc < 17);  // 2018-10-11: while inspecting OutBuffer;
  c01=""; c02=""; c03=""; c04=""; c05=""; // 2018-10-11
  c06=""; c07=""; c08=""; c09=""; c10=""; // 2018-10-11
  c11=""; c12=""; c13=""; c14=""; c15=""; // 2018-10-11
  c16="";  // 2018-10-11: clear out the AudBuffer.
  if (prsn == 1) {  // 2018-10-12: first person;
    if (snu == 1)  {  // 2018-10-12: subject-number parameter;
     ReEntry();  // 2018-10-12: for accumulating record of thought
    }  // 2018-10-12: end of test for singular subject-number;
    if (snu == 2)  {  // 2018-10-12: subject-number parameter;
     ReEntry();  // 2018-10-12: for accumulating record of thought
    }  // 2018-10-12: end of test for plural subject-number;
  }  // 2018-10-12: end of test for first person.
  if (prsn == 2) {  // 2018-10-12: second person;
    if (snu == 1)  {  // 2018-10-12: subject-number parameter;
     ReEntry();  // 2018-10-12: for accumulating record of thought
    }  // 2018-10-12: end of test for singular subject-number;
    if (snu == 2)  {  // 2018-10-12: subject-number parameter;
     ReEntry();  // 2018-10-12: for accumulating record of thought
    }  // 2018-10-12: end of test for plural subject-number;
  }  // 2018-10-12: end of test for second person.
  if (prsn == 3) {  // 2018-10-11: third person;
    if (snu == 1)  {  // 2018-10-11: subject-number parameter;
      if (b15 == "C" && b16 == "H") {  // last two characters in verb-stem
      pho = "E";  // 2018-10-11: add an "E" before "S"
      output += pho;  // 2018-10-11: inflection
      ReEntry();  // 2018-10-11: for accumulating record of thought
      }  // 2018-10-11: end of test for verb ending in "-ch"
      if (b15 == "S" && b16 == "H") {  // last two characters in verb-stem
      pho = "E";  // 2018-10-11: add an "E" before "S"
      output += pho;  // 2018-10-11: inflection
      ReEntry();  // 2018-10-11: for accumulating record of thought
      }  // 2018-10-11: end of test for verb ending in "-sh"
      pho = "S";  // 2018-10-11: add one single "S"
      output += pho;  // 2018-10-11: inflection
      ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of test for singular subject-number;
    if (snu == 2)  {  // 2018-10-12: subject-number parameter;
      ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-12: end of test for plural subject-number;
  }  // 2018-10-11: end of test for third-person.
  output += " ";  // add a space; 18oct2012
  Voice();  // 18oct2012
  audbase = 0;  // 2018-10-11: prevent carry-over
  gencon = 1;   // 2018-10-10: to prevent unwarranted calling of Speech()
  prsn = 0;     // 2018-10-11: prevent carry-over
  verbpsi = 0;  // 2018-10-11: prevent carry-over
}  // 2018-10-10: EnVerbGen() returns to EnVerbPhrase()


function EnVerbPhrase() {  // http://ai.neocities.org/EnVerbPhrase.html
  act = 0;  // 2018-01-14: Start with zero to look for psi1 higher than "act".
  audjuste = 0;  // 2018-01-14: prevent carry-over
  motjuste = 0;  // 2018-01-14: prevent carry-over
  negjux = 0;  // 2018-01-14: flag for 250=NOT juxtaposed to a verb;
  vphraud = 0;  // 2018-01-14: initially
  if (whatcon==1 && qv2psi==840) {  // 2018-05-13: if WHAT...840=THINK
    svo1 = qv1psi;  // 2018-05-13: try to use subject of query as subject of response.
    motjuste = 840;  // 2018-05-13: encourage selection of 840=THINK
    verbpsi = 840;  // 2018-05-13: let the concept of the verb be 840=THINK
    verblock = 0;  // 2018-06-03: let activated 840=THINK win selection.
  }  // 2018-05-13: end of test for WHAT...840=THINK query.
  if (verblock > 0 && motjuste != 840) {  // 2018-06-03: positive verblock?
    Psy[verblock].psyExam(); // 2018-01-04: inspect t=verblock row;
    verbpsi = psi1;  // 2018-01-04: the concept of the verb.
    if (psi5 == 250) negjux = 250;  // 2018-11-14: for negation of verb.
    prsn = psi7;    // 2018-11-14: for sake of EnAuxVerb() or EnVerbGen()
    subjnum = psi8;  // 2018-11-14: for sake of EnAuxVerb()
    if (psi12 > 0) seq = psi12;  // 2018-11-13: capture seq-tag.
    if (psi12 > 0) tselp = verblock;  // 2018-11-13: false at first
    nounlock = psi13; // 2018-11-14: psi13 tkb becomes nounlock.
    if (psi14 > 0) audbase = psi14;  // 2018-11-14: VerbGen() parameter;
    svo2 = psi1; // 2018-01-04: item #2 of subj - verb - ind.obj - dir.obj
    if (seq > 0 && wherecon == 0) {  // 2018-11-13: if seq-tag is positive...
      for (i = t; i>midway; --i) {  // 2018-11-13: search backwards in time.
        Psy[i].psyExam();  // 2018-11-14 BUGFIX: Examine the Psy concept-array.
        if (psi1==seq && psi6==6) {  // 2018-11-13: if engram matches seq...
          prep = psi1;  // 2018-11-13: identify the preposition as such.
          break;  // 2018-11-13: exit the loop upon finding the preposition.
        }  // 2018-11-13: end of search for a preposition matching the "seq".
      } // 2018-11-13: end of backwards loop.
      while (eureka != prep) {  // 2018-11-13:
        tselp++;  // 2018-11-13: increment the not-yet-true "tselp" variable
        Psy[tselp].psyExam(); // 2018-11-13: iterate to find "tselp" row in array.
        eureka = psi1;  // 2018-11-13: hold whatever is found as "eureka"
        if (tselp > cns) break;  // 2018-11-13: escape from any runaway-loop.
      }  // 2018-11-13:
    }  // 2018-11-13: end of test for positive seq-tag.
    if (psi14 > 0) aud = psi14; // 2018-01-04: auditory recall-vector
    if (psi14 > 0) vphraud = psi14;  // 2018-01-14: auditory recall-vector
    if (psi14 == 0) {  // 2018-01-30: if there is no auditory recall-vector "rv"...
      for (i = tpu; i>midway; --i) {  // 2018-01-30: search backwards from tpu
        Psy[i].psyExam(); // 2018-01-30: inspect Psy flag-panel
        if (psi1 == verbpsi && psi1 != 800 && negjux != 250) {  // 2018-10-04: if verb found...
          if (qv2num > 0) subjnum = qv2num;  // 2018-10-10: for query-response.
          if (psi1 == verbpsi && psi7 == prsn && psi8 == snu) {  // 2018-10-10:
            if (psi14 > 0) aud = psi14;  // 2018-10-10: find positive rv
            if (psi14 > 0) vphraud = psi14;  // 2018-10-10: auditory recall-vector
            if (psi14 > 0) break;  // 2018-10-10: exit loop if rv is found.
          }  // 2018-10-10: end of test to find regular or irregular verb-form
        }  // 2018-10-04: end of search for non-infinitive verb-form.
        if (psi1 == verbpsi && negjux == 250) {  // 2018-10-04: if verb is found...
          if (psi7==0 && psi14 > 0) aud = psi14;  // 2018-10-04: find positive rv;
          if (psi7==0 && psi14 > 0) vphraud = psi14;  // 2018-10-04: auditory rv;
          if (psi7==0 && psi14 > 0) break;  // 2018-10-04: exit loop if rv is found.
        }  // 2018-10-04: end of test for negjux requiring infinitive verb.
      }  // 2018-01-30: end of for-loop as part of search for recall-vector "rv".
    }  // 2018-01-30: end of test for no recall-vector rv as in InFerence()
    if (subjpsi==701 || subjpsi==731) prsn=1;  // 2018-01-14: I or WE
    if (svo1==701) prsn=1;     // 2018-01-14: I
    if (svo1==701) subjnum=1;  // 2018-01-14: I
    if (subjpsi==707 || subjpsi==737) prsn=2;  // 2018-01-14: "YOU"
    if (subjpsi==713 || subjpsi==719) prsn=3;  // 2018-01-14: HE; SHE
    if (subjpsi==725 || subjpsi==743) prsn=3;  // 2018-01-14: IT THEY
    dba = prsn;  // 2018-01-14:  parameter for VerbGen()
    for (i=tpu; i>midway; i--) {  // 2018-01-14: search Psy array before I/O
      Psy[i].psyExam(); // 2018-01-14: examine the Psy concept array...
      if (psi1 == verbpsi && psi1 == 800) {  // 2018-01-14: special 800=BE-verb
        if (psi6 == 8) {  // 2018-01-14: select only pos=8 verbs, even homonyms
          // Following code accepts only a verb-form matching three
          // requirements: [ ]same concept; [ ]num(ber); and [ ]person:
          if (qv2num > 0) subjnum = qv2num;  // 2018-01-14: for query-response.
          if (negjux==250) {  // 2018-10-04: 250=NOT requires AuxVerb + infinitive.
            if (psi1==verbpsi && psi7==0) {  // 2018-10-04:
              if (psi14 > 0) aud = psi14;  // 2018-10-04: find positive rv;
              if (psi14 > 0) vphraud = psi14;  // 2018-10-04: find positive rv;
              if (psi14 > 0) break;  // 2018-10-04: exit loop once rv is found.
            }  // 2018-10-04: end of test to find regular or irregular verb-form
          }  // 2018-10-04: end of test pre-empting inflected verb with infinitive.
          if (psi1==verbpsi && psi8==subjnum && psi7==prsn) {  // 2018-01-14
            if (psi14 > 0) aud = psi14;  // 20180114: find positive rv;
            if (psi14 > 0) vphraud = psi14;  // 2018-0114: find positive rv;
            if (psi14 > 0) break;  // 201801-14: exit loop once rv is found.
          }  // 2018-01-14: end of test to find regular or irregular verb-form
        }  // 2018-01-14 end of test for part-of-speech pos == "8" (verb)
      }  // 2018-01-14: end of test for correct verb-concept verbpsi.
      if (psi1 == verbpsi && psi1 != 800) {  // 2018-01-14: other than 800=BE
        if (psi6 == 8) {  // 2018-01-14: select only pos=8 verbs, even homonyms
          if (psi1==verbpsi && i==verblock) {  // 2018-01-14: zero in.
            if (psi14 > 0) aud = psi14;  // 2018-01-14: find positive rv;
            if (psi14 > 0) vphraud = psi14;  // 2018-01-14: find positive rv;
            if (psi14 > 0) break;  // 2018-01-14: exit loop once rv is found.
          }  // 2018-01-14: end of test to find regular or irregular verb-form
        }  // 2019-01-14: end of test for part-of-speech pos == "8" (verb)
      }  // 2018-01-14: end of test for correct verb-concept "verbpsi".
    }  // 2018-01-14: End of (for loop) searching for correct verb-form.
  }  // 2018-01-04: end of test for verblock.
  if (vphraud > 0) aud = vphraud;  // 2018-01-14: correct form?
  if (verblock == 0)  {  // 2018-01-14: prevent false negations;
    for (i=tpu; i>midway; i--) {  // 2018-01-14: search backwards in time.
      Psy[i].psyExam(); // 2018-01-14: examine the Psy concept array...
        if (psi6 == 8) {  // 2019-01-14: select only psi6 pos=8 verbs
          if (whatcon==1 && qv2psi==840 && psi1==840) {  // 2018-05-13:
            aud = psi14;  // 2018-06-11: recall-vector "rv" for Speech()
            break;  // 2018-05-13: peremptory retrieval of 840=THINK
          }  // 2018-05-13: end of test for WHAT...840=THINK query.
          if (psi3 > act) {  // 2018-10-04: if psi3 is higher than "act"...
            tselv = i;  // 2018-01-14: retain time of winning verb;
            motjuste = psi1;  // 2018-01-14: Select the most active verb.
            svo2 = psi1;  // 2018-01-14: for calling VisRecog()
            subjnum = psi8;  // 2018-10-03: for sake of EnAuxVerb()
            aud = psi14;  // 2018-06-11: recall-vector "rv" for Speech()
            act = psi3;  // 2018-10-04: to test for a higher psi3
          }  // 2018-01-14: end of test of activation-level.
        }  // 2018-01-14: end of test for part-of-speech pos == "8" verb
    }  // 2018-01-14: End of (for loop) searching for most active "motjuste"
  }  // 2018-01-14: end of test for absence of a verblock from subject to verb.
  if (negjux == 250) {  // 2018-01-14: if verb is negated with 250=NOT...
    if (svo2 != 800) {  // 2018-01-14: if other than an 800=BE verb...
      auxverb = 830;  // 2018-01-14: 830=DO as auxiliary verb;
      if (subjnum==0 && num != 0) subjnum = num;  // 2018-10-03: assumption.
      prsn = 3;  // 2018-10-03: default assumption before contradiction.
      if (subjpsi==701) subjnum = 1;  // 2018-10-03: 701=I
      if (subjpsi==701) prsn = 1;  // 2018-10-01: 701=I
      if (svo1==701) subjnum = 1;  // 2018-10-03: 701=I
      if (svo1==701) prsn = 1;  // 2018-10-01: 701=I
      EnAuxVerb();  // 2018-01-14: to say 830=DO or "DOES";
      auxverb = 0;  // 2018-01-14: reset for safety.
      for (i=tpu; i>midway; i--) {  // 2018-01-14: search for 250=NOT
        Psy[i].psyExam(); // 2018-01-14: examine the Psy concept array...
        if (psi1 == 250) {  // 2018-01-14: if 250=NOT is found...
          aud = psi14;  // 2018-01-14: "NOT" recall-vector for Speech()
          if (psi14 > 0) aud=psi14;  // 2018-01-14: recall-vector
          if (psi14 > 0) break;  // 2018-01-14: insurance
        }  // 2018-01-14: End of search for 250=NOT;
      }  // 2018-01-14: End of search loop back to midway.
      Speech();  // 2018-01-14: speak the word starting at the "aud" time.
      aud = 0;     // 2018-06-12: reset for safety.
    }  // 2018-01-14: end of test to prevent auxiliary with 800=BE verb.
  }  // 2018-01-14: end of test for 250=NOT negjux.
  motjuste = verbpsi;    // 2018-10-10: to search for verb-form.
  if (vphraud != 0) aud = vphraud;  // 2018-01-14: Accept rv of 3 parameters.
  if (subjpsi == 701) dba = 1;  // 2018-01-14: "I" 1st person sing.
  if (subjpsi == 707) dba = 2;  // 2018-01-14: "you" 2nd person sing.
  if (subjpsi == 713) dba = 3;  // 2018-01-14: "he" 3rd person sing;
  if (subjpsi == 719) dba = 3;  // 2018-01-14: "she" 3rd person sing.
  if (subjpsi == 725) dba = 3;  // 2018-01-14: "it" 3rd person sing.
  if (subjpsi == 731) dba = 1;  // 2018-01-14: "we" 1st person plural
  if (subjpsi == 737) dba = 2;  // 2018-01-14: "you" 2nd person plural
  if (subjpsi == 743) dba = 3;  // 2018-01-14: "they" 3rd person plural
  if (vphraud == 0) {  // 2018-01-14: if not substituted above...
    for (i=tpu; i>midway; i--) {  // 2018-01-14: skip current engrams.
      svo2 = motjuste;  // 2018-01-14: TEST; REMOVE
      if (psi1 == verbpsi && psi14 > 0) audbase = psi14;  // 2018-10-10: 2nd best
      if (psi1 == verbpsi && psi7 == 0 && psi14 > 0) audbase = psi14;  // 2018-10-10:
      if (psi1 == verbpsi && psi7 == prsn && psi8 == nphrnum) {  // 2018-10-10
        vphraud = psi14;  // 2018-10-10: VerbPhrase auditory engram tag
      }  // 2018-10-10: end of test to find regular or irregular verb-form
      if (negjux==250) dba=0;  // 2018-10-04: after "NOT" use infinitive
      if (psi7 == dba)  {  // 2018-01-14: for proper person;
        if (psi8 == snu) {  // 2018-01-14: subject num(ber) parameter;
          vphraud = psi14;  // 2018-01-14: auditory recall-vector;
          break;  // 2018-01-14:  exit the loop after first find.
        }  // 2018-01-14: end of subject number-parameter test;
      }  // 2018-01-14: end of dba-parameter test.
    }  // 2018-01-14: end of (for loop) searching through Psy conceptual array.
  }  // 2018-01-14: end of test of vphraud.
  if (vphraud == 0) EnVerbGen();  // 2018-10-10: if no verb-form, generate it.
  if (vphraud > 0) aud = vphraud;  // 2018-01-14: correct form?
  if (svo2 == 800) numreq = subjnum;  // 2018-05-25: for fetching predicate nominative.
  Speech();  // 2018-01-14: main call from EnVerbPhrase() to Speech()
  aud = 0;  // 2018-01-14: Reset to prevent carry-over.
  Psy[tselv].psyExam(); // 2018-01-14: inspect verb for inhibition at time of selection.
  Psy[tselv] = new
 psyNode(psi0,psi1,psi2,-16,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
  // Above line inserts neural inhibition upon currently selected verb.
  if (tselp > 0 && prep > 0 && wherecon == 0) {  // 2018-11-13: preposition?
    SpreadAct();  // 2018-11-13: to generate a prepositional phrase
    prep = 0;     // 2018-11-13: reset to prevent carry-over.
  }  // 2018-11-13: end of test for conditions warranting SpreadAct for preposition.
  if (svo2 == 800) {  // 2018-01-14: if the selected verb is a be-verb
    if (negjux == 250) {  // 2018-01-14: if there is a 250=NOT negation flag...
      for (i=tpu; i>midway; i--) {  // 2018-01-14: search for 250=NOT
        Psy[i].psyExam(); // 2018-01-14: examine the Psy concept array...
        if (psi1 == 250) {  // 2018-01-14: if 250=NOT is found...
          if (psi14 > 0) aud = psi14;  // 2018-01-14: auditory recall vector
          Speech();  // 2018-06-12: speak the word starting at the "aud" time.
          aud = 0;  // 2018-06-12: reset for safety.
          negjux = 0;  // 2018-01-14: reset for safety.
          if (psi14 > 0) break; // 2018-01-14: insurance
        }  // 2018-01-14: End of search for 250=NOT.
      }  // 2018-01-14: End of search loop back to midway.
      negjux = 0;  // 2018-01-14: reset for safety.
    }  // 2018-01-14: end of test for negated be-verb.
  }  // 2018-01-14: end of test for 800=BE verb in case of negation.
  if (svo2 != 800) negjux = 0;  // 2018-06-12: reset after one chance to matter.
  if (nounlock > 0) dirobj = 1;  // 2018-10-04: for sake of intransitive verbs.
  if (subjpsi == 701) {  // 2018-01-14: only for subject 701=I;
    if (svo2 == 820) {   // 2018-01-14: only for verb 820=SEE;
      if (svo4 == 0) {  // 2018-01-14: if SEE has no direct object...
      // 2018-01-14: i.e., if there is no robot camera for computer vision...
        VisRecog();  // 2018-01-14: a challenge for robot AI coders.
        svo2 = 0;  // 2018-01-14: reset for safety.
        svo4 = 0;  // 2018-01-14: reset for safety.
        return;    // 2018-01-14: abandon rest of VerbPhrase()
      }  // 2018-01-14: end of test for direct object.
    }  // 2018-01-14: end of test for "820=SEE".
  }  // 2018-01-14: end of test for ego-concept 701=I as subject.
   if (dirobj==1 && qv2psi != 840 && dunnocon != 1) {  // 2018-10-04: 840=THINK
     EnNounPhrase();  // 2018-01-04: for direct object or predicate nominative
   }  // 2018-10-06: end of tests for fetching a direct object.
    if (dirobj==0 && qv2psi==840) {  // 2018-10-06: special for 840=THINK
      conj = 310;  // 2018-10-06: prepare to use 310=THAT conjunction
      ConJoin();  // 2018-10-06: use conjunction
    }  // 2018-10-06: end of test for 840=THINK
    if (whatcon==0 && actpsi > 0) {  // 2018-10-02: if there is activation to spread...
      SpreadAct();  // 2018-06-03: for a chain of thought.
      actpsi = 0;  // 2018-06-03: reset to zero for safety
  }  // 2018-05-13: end of whatcon-test to fetch conjunction instead of object.
  dirobj = 0;  // 2018-01-14: reset flag after thinking direct object.
  if (prepgen > 0) EnPrep();  // 2018-01-14: if "Where?" call EnPrep().
  audbase = 0;  // 2018-01-14: reset for safety.
  negjux - 0;   // 2018-10-04: prevent carry-over.
  num = 0;      // 2017-01-14: reset after output of one query-response.
  qv2num = 0;   // 2017-01-14: reset after output of one query-response.
}  // 2018-01-01: EnVerbPhrase() returns to Indicative() module.


function InFerence() {  // http://ai.neocities.org/InFerence.html
  moot = 1;  // prevent interference via tag-forming; 18mar2013
  apb = "If silent inference is made, answer question to confirm or refute.";
  Voice();  // 23mar2013
  if (prednom > 0) {  // positive predicate nominative? 18mar2013
    for (i = tpu; i>midway; i--) {  // 2018-01-25: search KB to infer facts.
      Psy[i].psyExam(); // 2018-01-25: examine Psy concept-array;
      // 20mar2013 Let only plural KB subjects be basis for InFerence:
      if (prednom == psi1 && psi8 == 2) {  // 2018-01-25: plural KB data?
        if (psi7 == 1) {  // 2018-01-25: dba nominative for subject?
          if (seqverb == 0) {  // only once; 18mar2013
            seqtkb = psi13;  // 2018-01-25: hold for fetching same direct object;
            seqverb = psi12;  // 2018-01-25: hold to be the verb of an inference.
            quverb = psi12;  // 2018-01-27: query-verb for AskUser;
            ynverb = 0;  // 2018-01-25: since lacking, use quverb for AskUser()
            seq = seqverb;  // 2018-01-25: to be inferred as applying to subject.
          }  // 2018-01-25: end of test that no "seqverb" has yet been declared.
        }  // 2018-01-25: end of test that "prednom" does occur in nominative.
      } // 2018-01-25: end of test for a fact about the "prednom" as plural subject.
    }  // 2018-01-25: end of backwards loop in search of inferrable knowledge.
  }  // 2018-01-25: end of test for positive predicate nominative.
  if (seqverb > 0) {  // verb available for inference? 18mar2013
    inft = t;  // for AskUser to find auditory engrams 18mar2013
    t = (t+1);  // increment time "t" by one for a gap; 18mar2013
    t = (t+1);  // increment time to create an inference; 18mar2013
    Psy[t].psyExam(); // 2018-01-25: expose row where no values are present;
    psi7 = 1;  // 2018-10-11: subject noun serves as 1=nominative
    psi8 = 1;  // 2018-10-11: assumed singular because of Is-A quality.
    seq = seqverb;  // prevent override? 18mar2013
    psi13 = (t+1);  // 2018-01-25: psi13=tkb, which is one unit later;
    Psy[t] = new  // 2018-01-25: psi1 subjnom; psi3 act; psi6 pos; psi8 qusnum; psi12 seq;
 psyNode(psi0,subjnom,psi2,48,psi4,psi5,5,1,1,0,psi10,psi11,seqverb,psi13,psi14);
    tkbn = t;  // 2018-01-28: conceptual array-time for subject-noun of AskUser query.
    t = (t+1);  // 2018-01-25: increment t for storage of inference-verb;
    Psy[seqtkb].psyExam(); // 2018-01-25: obtain dobseq from Psy array;
    dobseq = psi12;  // 2018-01-25: to serve as psi12 "seq" in next insertion;
    quobj = dobseq;  // 2018-01-25: so AskUser() will use the particular dir.obj.
    Psy[t].psyExam(); // 2018-01-25: expose values for change of some;
    Psy[t] = new  // 2018-01-25: psi1 seqverb; 6 pos; 10 pre; 12 dobseq; 13 tkb;
psyNode(psi0,seqverb,psi2,psi3,psi4,psi5,8,3,1,psi9,subjnom,psi11,dobseq,(t+1),psi14);
    tkbv = t;  // 2018-01-28: conceptual array-time for verb of AskUser query.
    t = (t+1);  // 2018-01-25: increment time to store direct object;
    tkbo = t;   // 2018-01-29: conceptual array-time for object-noun of AskUser query.
    Psy[seqtkb].psyExam(); // 2018-01-25: obtain seqdob from Psy array;
    seqdob = psi12;  // 2018-01-25: to serve as "psi1" in next insertion;
    seqrvx = psi14;  // 2018-01-25: to serve as "psi14" in next insertion;
    Psy[t].psyExam(); // 2018-01-25: expose values for change of some;
    Psy[t] = new  // 2018-01-25: psi1 seqverb; 6 pos; 10 pre; 12 dobseq; 13 tkb;
psyNode(psi0,seqdob,psi2,40,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,seqrvx);
    quobj = dobseq;  // 2018-01-25: for transfer to AskUser;
    t = (t+1);  // 2018-01-25: increment time "t" for an ending gap;
    yncon = 1;  // 2018-01-25: for AskUser() to ask yes-or-no question;
    qusub = subjnom;  // 2018-01-25: for transfer to AskUser();
  }  // 2018-01-25: end of test for a verb to be part of inference.
  becon = 0;  // 2018-01-25: reset after use;
  dobseq = 0;  // 2018-01-25: reset after use; 18mar2013
  moot = 0;  // 2018-01-25: reset after use; 18mar2013
  prednom = 0;  // 2018-01-25: reset after use; 18mar2013
  seqdob = 0;  // 2018-01-25: reset after use; 18mar2013
  seqrvx = 0;  // 2018-01-25: reset after use;
  seqtkb = 0;  // 2018-01-25: reset after use;
  seqverb = 0;  // 2018-01-25: reset after use;
  subjnom = 0;  // 2018-01-25: reset after use;
}  // 2018-01-25: InFerence() returns to EnThink()


function Indicative() {  // http://ai.neocities.org/Indicative.html
  moot = 0;  // 2018-01-21: start with no suppression of associative tags.
  pov = 1;      // 2018-01-21: thinking occurs in self or "I" mode.
  rv = 0;       // 2018-01-21: lest rv fail to be at zero for AudInput()
  tdo = 0;      // 2018-01-21: reset time-of-direct-object for safety.
// tvb = 0;      // 2018-01-21: reset time-of-verb for safety before thinking.
// tvb = 0;      // 2018-11-14: reset not here but in Sensorium()
  qucon = 0;    // 2018-01-21: reset for safety.
  if (dunnocon == 1) {  // 2018-10-01: if AI cannot answer a query with knowledge
    for (i=vault; i>0; i--) {  // 2018-10-01: search backwards in KB "vault"
      Psy[i].psyExam(); // 2018-10-01: inspect the Psy concept flag-panel
        if (psi1==701 && psi12==850) {  // 2018-10-01: if I...KNOW...
          psi0 = 32;  // 2018-10-01: elevate activation of truth-value tru
          psi3 = 256;  // 2018-10-01: highly activate "I DO NOT KNOW"
          psi5 = 250;  // 2018-10-01: make sure "KNOW" is negated.
          Psy[i] = new  // 2018-10-01: inserting new values into flag-panel.
psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
          break;  // 2018-10-01: skip rest of KB vault.
        }  // 2018-10-01: end of test for 701=I and 850=KNOW.
      }  // 2018-10-01: End of search loop from vault down to t=zero.
  }  // 2018-10-01: end of test for flag requiring answer "I DO NOT KNOW".
  EnNounPhrase();  // 2018-01-12: fetch noun or pronoun as subject of thought.
  EnVerbPhrase();  // 2018-01-01: call the module to select an English verb.
  if (dunnocon == 1) {  // 2018-10-02: prepare to change flag after output...
    for (i=vault; i>0; i--) {  // 2018-10-02: search KB vault.
      Psy[i].psyExam(); // 2018-10-02: inspect the Psy concept flag-panel
        if (psi1==701 && psi12==850) {  // 2018-10-02: if I...KNOW...
          psi0 = 0;  // 2018-10-02: remove activation of truth-value "tru"
          psi3 = 0;  // 2018-10-02: remove activation from  "I DO NOT KNOW"
          Psy[i] = new  // 2018-10-02: changing the values in the flag-panel.
psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
          break;  // 2018-10-02: skip rest of KB vault.
        }  // 2018-10-02: end of test for 701=I and 850=KNOW.
      }  // 2018-10-02: End of search loop from vault down to t=zero.
      dunnocon = 0;  // 2018-10-02: zero out to prevent carry-over.
      snu = 0;  // 2018-10-10: prevent carry-over
      whatcon = 0;   // 2018-10-02: TEST
  }  // 2018-10-01: end of test for "dunnocon" flag after its output.

  nounlock = 0;  // 2018-01-21: reset for safety.
  qucon = 0;    // 2018-01-21: reset to prevent unwarranted SpreadAct()
  svo1 = 0;     // 2018-01-21: reset subject-verb-object values for safety.
  qv1psi = 0;   // 2018-01-21: reset SpreadAct subject-psi for safety.
  svo2 = 0;     // 2018-01-21: reset subject-verb-object values for safety.
  qv2num = 0;   // 2018-01-21: reset after output of one query-response.
  qv2psi = 0;   // 2018-01-21: reset SpreadAct verb-psi for safety.
  svo3 = 0;     // 2018-01-21: reset subject-verb-object values for safety.
  svo4 = 0;     // 2018-01-21: reset subject-verb-object values for safety.
  seqpsi = 0;   // 2018-01-21: reset for the sake of SpreadAct()
// tvb = 0;      // 2018-01-21: reset time-of-verb for safety.
  verblock = 0; // 2018-01-21: reset for safety.
// tvb = 0;      // 2018-01-21: reset time-of-verb for safety.
  PsiDecay();  // 2018-01--12: Reduce conceptual activation after each thought.
  bias = 5;    // 2018-01-30: expect a noun, in case user inputs unknown word.
}  // 2018-01-01: Indicative returns to EnThink().


function Imperative() {  // 2018-01-14
  // 2018-01-14: mind-module stubbed in for issueing command.
  moot = 1;  // 2018-09-21: prevent forming of associative tags.
  output = "";  // 2018-09-21: remove any previous output-display.
  for (i = vault; i>midway; i--) {  // 2018-09-21: "vault" is reliable.
    Psy[i].psyExam(); //  2018-09-21: examine conceptual Psy array;
    if (psi1==882) {  // 2018-09-21: 883=TEACH;
      aud = psi14;  // 2018-09-21: auditory recall-vector;
      break;  // 2018-09-21: one example is enough.
    }  // 2018-01-26: end of test for #882=TEACH
  }  // 2018-09-21: end of backwards loop;
  Speech();  // 2018-09-21: speak the word "TEACH"
  Voice();  // 2018-09-21: makes the message appear on-screen.
  for (i = vault; i>midway; i--) {  // 2018-09-21: "vault" is reliable.
    Psy[i].psyExam(); //  2018-09-21: examine conceptual Psy array;
    if (psi1==701 && psi7 == 3) {  // 2018-09-21: dative 701=ME
      aud = psi14;  // 2018-09-21: auditory recall-vector;
      break;  // 2018-09-21: one example is enough.
    }  // 2018-01-26: end of test for #701=ME
  }  // 2018-09-21: end of backwards loop;
  Speech();  // 2018-09-21: speak the word "ME"
  Voice();  // 2018-09-21: makes the message appear on-screen.
  for (i = vault; i>midway; i--) {  // 2018-09-21: "vault" is reliable.
    Psy[i].psyExam(); //  2018-09-21: examine conceptual Psy array;
    if (psi1==755) {  // 2018-09-21: 755=SOMETHING;
      aud = psi14;  // 2018-09-21: auditory recall-vector;
      break;  // 2018-09-21: one example is enough.
    }  // 2018-01-26: end of test for #755=SOMETHING
  }  // 2018-09-21: end of backwards loop;
  Speech();  // 2018-09-21: speak the word "SOMETHING"
  Voice();  // 2018-09-21: makes the message appear on-screen.
  moot = 0;  // 2018-09-21: end prevention of associative tags.
}  // Imperative() returns to the EnThink() module.


function EnThink() {  // http://ai.neocities.org/EnThink.html
  prep = 0;  // 2018-11-13: in case "prep" was set by EnParser()
  tdo = 0;      // 2018-07-12: reset time-of-direct-object for safety.
  tkb = 0;  // 2018-07-12: reset for safety.
  inert = (inert + 1);  // 2018-01-20: but AudListen() resets to zero;
  lurk = (lurk + 1);    // 2018-01-20: AudListen() resets to zero;
  if (isolation > 60) {  // 2018-11-14: if no input for arbitrary duration...
    Imperative();  // 2018-09-21: Issue a request for input from a human user.
    impetus = 0;   // 2018-09-21: reset the trigger for calling Imperative().
    isolation = 0; // 2018-10-03: reset the trigger for calling Imperative().
    return;  // 2018-09-21: abandon EnThink(); give human user a chance to respond.
  }  // 2018-09-21: end of test for trigger to call Imperative()
  if (qucon==1 || whatcon==1 || wherecon==1) SpreadAct();  // 2018-10-28:
  apb = "EnThink() at time = "+t+"; rejuvenations = "+rjc+"; since dob "+dob; // 2018-01-24:
  Voice();  // 2018-01-20: speak the all-points-bulletin "apb";
  if (kbcon > 0) {  // 2018-01-28: if user answers yes-or-no question;
    KbRetro();  // 2018-01-28: retroactively adjust knowledge base;
    kbcon = 0;  // 2018-01-28: reset for safety;
    kbzap = 0;  // 2018-01-28: reset for safety.
  }  // 2018-01-28: User has had one chance to answer yes-or-no question.
  inft = t;  // 2018-01-25: in case inference-time not otherwise set;
  if (becon == 1) {  // 2018-01-25: if user input includes 800=BE-verb...
    InFerence(); // 2018-01-25: make a silent inference;
  }  // 2018-01-25: end of test for incoming be-verb.
  if (yncon == 1) {  // 2018-01-25: set in the InFerence() module
    tdo = 0;  // 2018-07-12: prevent carry-over.
    AskUser();  // 2018-01-25: for yes-or-no query;
    return;  // 2018-01-25: abandon the rest of EnThink()
  }  // 2018-01-25: end of test to trigger asking a question.
  abort = false;  // 2018-01-20:
  document.all.cosmos.innerHTML = ""; // 2018-01-04: blank out lower screen.
  if (nucon > 0) {  // 2018-01-23: if a new noun is encounter in NewConcept()
    SpreadAct();  // 2018-01-23: to activate concepts for a question.
    nucon = 0;    // 2018-01-23: reset for safety.
    pov = 2;      // 2018-01-23: give human user a "pause" for input...
    return;  // 2018-01-23: after question abandon rest of function.
  }  // 2018-01-23: end of test for the condition of input of a new concept.
  if (quiet == true || quiet == false) {  // 2018-06-11: temporary laissez-faire...
    pov = "1";  // 2018-01-20: internal point-of-view for thinking.
    output = "";  // blank out the output of the previous thought;
    outputplus = "";  // blank out the display of the previous thought.
    t = (t + 1);  // 2018-10-14: skip one time-point before edge="{"
    audMemory[t].audExam();  // 2018-10-12: ReJuvenate test;
    audMemory[t] = new audNode("{",aud1,aud2); // 2018-10-12
    Indicative();  // 2018-01-20: think in the indicative mood.
  } // 2018-01-20: // 2018-01-20: end of test for absence of user input.
  ConJoin();  // 2018-05-13: Output one more idea with sufficient activation.
// if (whatcon==1 && conj > 0) {  // 2018-06-03: for a conjoined idea...
  if (conj > 0) {  // 2018-10-06: for a conjoined idea...
    whatcon = 0;  // 2018-05-13: reset to prevent run-on thoughts.
    Indicative();  // 2018-05-13: think in the indicative mood.
  }  // 2018-05-13: end of whatcon-test in favor of subordinate clause.
  if (rsvp > -1) {  // 2018-05-20: and if there is no input...
    rsvp = (rsvp - 100);  // 2018-05-20: recrement rsvp-wait in absence of input
    if (rsvp < 0) rsvp = 0;  // 2018-05-20: disallow negative "rsvp".
  }  // 2018-05-20: end of test for lack of input as reason to speed up thinking.
  for (i = 1; i<(rsvp+100); i++) {  // 2018-05-20: delay for user to respond to output
  if (i > 1) { apb = "Rejuvenations = "+rjc+ "; time = "+t+"; isolation = "+isolation; Voice() }
  }  // 2018-05-20: end of delay to give time for user input.
  conj = 0;  // 2018-06-03: prevent carry-over.
  quiet = true;  // 2018-06-11: after AI responds to input, things quiet down.
  subjnom = 0;  // 2018-06-11: prevent carry-over.
  tpu = t;  // 2018-10-02: time-pen-ultimate -- before new input.
} // 2018-01-20: EnThink() returns to the FreeWill Volition() module.


function Volition() {  // http://ai.neocities.org/Volition.html
  apb = "Volition has been called and life = "+life;  // 2018-01-21: more informative
  Voice();
// Emotion();  // 2018-03-17: so emotions may influence otherwise rational thought.
  if (life == true) {  // 2018-01-21: when user checks "Halt", stop thinking.
    EnThink(); // 2017-12-31: think in English.
  }  // 2018-01-21: end of test for "life" status.
// Motorium();  // 2018-03-17: so that emotion and thought may initiate actions.
} // 2018-01-20: FreeWill Volition() module returns to MainLoop()


function MetEmPsychosis() {  // 2018-01-14
  // 2018-01-14: stubbed in for AI Mind Maintainers to consider.
  // 2018-01-15: feasible in Perl, etc., but not in JavaScript.
}  // MetEmPsychosis() will return to...


function Motorium() {  // 2018-01-14
  // 2018-01-14: stubbed in for AI Mind Maintainers to consider.
}  // Motorium() will return to Volition()


function Diagnostic() {
  psiList();
  audList();
  if (trouble == true) {
    document.all.tabula.innerHTML = "";
    document.all.psicolumn.innerHTML = psidata;
    document.all.audcolumn.innerHTML = auddata;
   }
  html = "";
  psidata = ("<b>" + "Concepts with associative tags for ");  // 2018-01-16
  psidata += ("Natural Language Understanding:" + "<\/b>" + "<BR>");
  psidata += ("krt tru psi hlc act mtx jux pos dba num mfn pre iob seq tkb rv");
  auddata = ("<b>" + "Auditory memory nodes" + "<\/b>" + "<BR>");
  auddata += ("krt pho act audpsi"); // 2018-01-16
}


function HCI() {  // http://mind.sourceforge.net/hci.html
  if (document.all["cb3"].checked == true) {
    document.all["cb1"].checked = false;
    document.all.souvenir.innerHTML = "";
    document.all["cb2"].checked = false;
     tutor = false;
    trouble = true;
    fyi = 3;
  }
  if (document.all["cb3"].checked == false) {
    document.all.tabula.innerHTML = "";
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
    trouble = false;
  }
  if (document.all["cb1"].checked == true) {
    document.all["cb2"].checked = false;
     document.all["cb3"].checked = false;
    document.all.tabula.innerHTML = "";
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
    trouble = false;
    hardcopy = true;
    fyi = 1;
    now = new Date();
    adcopy=("AI Mind version "+vrsn+" on " +now);
    document.all.souvenir.innerHTML = adcopy;
  }
  if (document.all["cb1"].checked == false) {
    document.all.souvenir.innerHTML = "";
    hardcopy = false;
    document.all.tabula.innerHTML = "";
  }
  if (hardcopy == true) {
    if (userline != "" || output != "" ) {
      Transcript();
    }
  }
  if (document.all["cb2"].checked == true) {
    document.all["cb1"].checked = false;
    document.all.souvenir.innerHTML = "";
    hardcopy = false;
    document.all["cb3"].checked = false;
    document.all.tabula.innerHTML = "";
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
    trouble = false;
    tutor = true;
    fyi = 2;
  }
  if (document.all["cb2"].checked == false) {
    tutor = false;
    if (fyi == 2) fyi = 0;
  }
  if (trouble == true) {
    Diagnostic();
  }
  if (life == true) {
    document.forms[1].ear.focus();
  }
}  // 2018-01-21: HCI() returns to Security module.

// 2021-01-24
function Health(_state) {
  Medical(_state); // call Medical Function from health for security reasons
}

// 2021-01-14 - Sub in Medical FUNCTIONS
function Medical(_state) {
  // medical request/response Medical Health and Security
}

// 2021-01-24 Adding Offense Measures
// Used for Defensive Returns
function Offense() {

}

// 2021-01-24 Adding Defense Measures
function Defense() {

}

function Security(_state) {
  Health(_state);
  Defense(_state).Offense(_state);

  HCI();  // 2018-01-18: Human Computer Interfact
  Voice();
  console.log('STATE: ', _state, 'PSI', psi);

  if (t > (cns-64)) ReJuvenate();

  if (t > 160)  nonce = vault;  // Diagnostic display of all thought.
  nonce = vault;  // for quicker loading; 25oct2012

  if (life == true) {
    // build security protocols for monitoring active agents.
    apb=`AI Mind at t${t} is alive on cyc #${rjc} since ${dob}`;
    if (t > (cns-32)) apb = `WARNING!  Consider clicking Refresh. Only ${cns-t}`;
  }
  else {
    // monitor for dead ghosts
    apb=("<font color='red'>"+"Mental function suspended."+"<\/font>");
  }
}


function MainLoop() {  // http://ai.neocities.org/MainLoop.html
  isolation++;  // 2018-10-03: increment incentive for Imperative()
  Security('MindLoop');
  Sensorium();  // 2018-01-18:
  brain = true;
  Volition(); // 2018-01-15: in conformance with modern ghost.pl AI
  MindLog('MainLoop');

  // if (life == true) {
  //   TID=window.setTimeout("MainLoop();",10000);
  // }

}  // 2018-01-20: End of MainLoop.
