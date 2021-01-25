function Parser() { // http://ai.neocities.org/EnParser.html
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

module.exports = Parser;
