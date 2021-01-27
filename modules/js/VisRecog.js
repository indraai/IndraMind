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

module.exports = VisRecog;
