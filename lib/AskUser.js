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

module.exports = AskUser;
