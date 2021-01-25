function VerbPhrase() {  // http://ai.neocities.org/EnVerbPhrase.html
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

module.exports = VerbPhrase;
