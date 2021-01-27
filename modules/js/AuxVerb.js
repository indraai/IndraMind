function AuxVerb() {  // http://ai.neocities.org/EnAuxverb.html
 tdo = 0;  // 2018-07-12: prevent carry-over.
 if (auxverb==830) {  // 2018-01-26: 830=DO;
  if (subjnum == 1 && prsn == 1) {  // 2018-01-26: first person singular?
    for (i = vault; i>midway; i--) {  // 2018-01-26: "vault" is reliable.
      Psy[i].psyExam(); //  2018-01-26: examine conceptual Psy array;
      if (psi1==830 && psi8==1 && psi7==1) {  // 2018-01-26: 830=DO;
        aud = psi14;  // 2018-01-26: auditory recall-vector;
        break;  // 2018-01-26: one example is enough.
      }  // 2018-01-26: end of test for singular #830=DO;
    }  // 2018-01-26: end of backwards loop;
    Speech();  // 2018-01-26:
  }  // 2018-01-26: end of test for 1st person singular;
  if (subjnum == 1 && prsn == 2) {  // 2018-01-26: second person singular?
    for (i = vault; i>midway; i--) {  // 2018-01-26: "vault" is reliable.
      Psy[i].psyExam(); //  2018-01-26: examine conceptual Psy array;
      if (psi1==830 && psi8==1 && psi7==2) {  // 2018-01-26: 830=DO;
        aud = psi14;  // 2018-01-26: auditory recall-vector;
        break;  // 2018-01-26:
      }  // 2018-01-26: end of test for singul;ar 830=DO;
    }  // 2018-01-26: end of backwards loop;
    Speech();  // 2018-01-26:
  }  // 2018-01-26: end of test for 2nd person singular;
  if (subjnum == 1 && prsn == 3) {  // 2018-01-26: singular num(ber)?
    for (i = vault; i>midway; i--) {  // 2018-01-26: "vault" is reliable.
      Psy[i].psyExam(); //  2018-01-26: examine conceptual Psy array;
      if (psi1==830 && psi8==1 && psi7==3) {  // 2018-01-27: 830=DO;
        aud = psi14;  // 2018-01-26: auditory recall-vector;
        break;  // 2018-01-26:
      }  // 2018-01-26: end of test for 830=DOES;
    }  // 2018-01-26: end of backwards loop;
    Speech();  // 2018-01-26
  }  // 2018-01-26: end of test for 3rd person singular;
  if (subjnum == 2 && prsn == 1) {  // 2018-01-26: plural num(ber)?
    for (i = vault; i>midway; i--) {  // 2018-01-26: "vault" is reliable.
      Psy[i].psyExam(); //  2018-01-26: examine conceptual Psy array;
      if (psi1==830 && psi8==2 && psi7==1) {  // 2018-01-26: 830=DO;
        aud = psi14;  // 2018i-01-26: auditory recall-vector;
        break;  // 2018-01-26:
      }  // 2018-01-26: end of test for plural 830=DO;
    }  // 2018-01-26: end of backwards loop;
    Speech();  // 2018-01-26:
  }  // 2018-01-26: end of test for 1st person plural;
  if (subjnum == 2 && prsn == 2) {  // 2018-01-26: plural num(ber)?
    for (i = vault; i>midway; i--) {  // 2018-01-26: "vault" is reliable.
      Psy[i].psyExam(); //  2018-01-26: examine conceptual Psy array;
      if (psi==830 && psi8==2 && psi7==2) {  // 2018-01-26: 830=DO;
        aud = psi14;  // 2018-02-04: auditory recall-vector;
        break;  // 2018-01-26:
      }  // 2018-01-26: end of test for plural 830=DO;
    }  // 2018-01-26: end of backwards loop;
    Speech();  // 2018-01-26:
  }  // 2018-01-26: end of test for 2nd person plural;
  if (subjnum == 2 && prsn == 3) {  // 2018-01-26: plural num(ber)?
    for (i = vault; i>midway; i--) {  // 2018-01-26: "vault" is reliable.
      Psy[i].psyExam(); //  2018-01-26: examine conceptual Psy array;
      if (psi1==830 && psi8==2 && psi7==3) {  // 2018-01-26: 830=DO;
        aud = psi14;  // 2018-01-26: auditory recall-vector;
        break;  // 2018-01-26:
      }  // 2018-01-26: end of test for plural 830=DO;
    }  // 2018-01-26: end of backwards loop;
    Speech();  // 2018-01-26:
  }  // 2018-01-26: end of test for 3rd person plural;
 }  // 2018-01-26: end of test for 830=DO auxiliary verb;
// prsn = 0;  // after auxiliary prevent verb-inflection; 17jun2015
// verbprsn = 0;  // after auxiliary use infinitive verb-form; 17jun2015
 infincon = 1;  // 2018-01-26: after auxiliary set infinitive condition;
}  // End of AuxVerb(); return to EnVerbPhrase(O) or AskUser()

module.exports = AuxVerb;
