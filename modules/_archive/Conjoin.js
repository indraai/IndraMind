function Conjoin() {  // http://ai.neocities.org/ConJoin.html
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

module.exports = Conjoin;
