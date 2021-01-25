function Imperative() {  // 2018-01-14
  // 2018-01-14: mind-module stubbed in for issueing command.
  moot = 1;  // 2018-09-21: prevent forming of associative tags.
  output = "";  // 2018-09-21: remove any previous output-display.
  for (i = vault; i>midway; i--) {  // 2018-09-21: "vault" is reliable.
    Psy[i].psyExam(); //  2018-09-21: examine conceptual Psy array;
    if (psi1==882) {  // 2018-09-21: 883=TEACH;
      aud = psi14;  // 2018-09-21: auditory recall-vector;
      break;  // 2018-09-21: one example is enough.
    }  // 2018-01-26: end of test for #882=TEACH
  }  // 2018-09-21: end of backwards loop;
  Speech();  // 2018-09-21: speak the word "TEACH"
  Voice();  // 2018-09-21: makes the message appear on-screen.
  for (i = vault; i>midway; i--) {  // 2018-09-21: "vault" is reliable.
    Psy[i].psyExam(); //  2018-09-21: examine conceptual Psy array;
    if (psi1==701 && psi7 == 3) {  // 2018-09-21: dative 701=ME
      aud = psi14;  // 2018-09-21: auditory recall-vector;
      break;  // 2018-09-21: one example is enough.
    }  // 2018-01-26: end of test for #701=ME
  }  // 2018-09-21: end of backwards loop;
  Speech();  // 2018-09-21: speak the word "ME"
  Voice();  // 2018-09-21: makes the message appear on-screen.
  for (i = vault; i>midway; i--) {  // 2018-09-21: "vault" is reliable.
    Psy[i].psyExam(); //  2018-09-21: examine conceptual Psy array;
    if (psi1==755) {  // 2018-09-21: 755=SOMETHING;
      aud = psi14;  // 2018-09-21: auditory recall-vector;
      break;  // 2018-09-21: one example is enough.
    }  // 2018-01-26: end of test for #755=SOMETHING
  }  // 2018-09-21: end of backwards loop;
  Speech();  // 2018-09-21: speak the word "SOMETHING"
  Voice();  // 2018-09-21: makes the message appear on-screen.
  moot = 0;  // 2018-09-21: end prevention of associative tags.
}  // Imperative() returns to the EnThink() module.

module.exports = Imperative;
