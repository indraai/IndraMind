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

module.exports = Instantiate;
