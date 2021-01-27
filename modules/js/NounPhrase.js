function NounPhrase() {  // http://ai.neocities.org/EnNounPhrase.html
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

module.exports = NounPhrase;
