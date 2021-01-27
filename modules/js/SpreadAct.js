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

module.exports = SpreadAct;
