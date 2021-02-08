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
module.exports = Indicative;
