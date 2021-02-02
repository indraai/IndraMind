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

module.exports = EnPrep;
