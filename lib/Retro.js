function Retro() {  // http://ai.neocities.org/KbRetro.html
  if (kbzap == 432 || kbzap == 404) {  // 2018-01-28: if 432=YES or 404=NO...
    if (kbzap == 404) {  // 2018-01-28: 404=NO;
    apb = "KbRetro() adjusts the knowledge base for the answer: NO";
    Voice(); // 2018-01-29: display "apb" message
    Psy[tkbv] = new // 2018-01-27: changing psi3=act; psi5=jux;
   psyNode(0,quverb,1,32,0,250,8,0,0,0,qusub,psi11,quobj,tkbo,0);  // 2018-10-11
    }  // 2018-01-27: End of test for "no" answer.
    if (kbzap == 432) { // 2018-01-28: 432=YES;
      apb = "KbRetro() adjusts the knowledge base for the answer: YES";
      Voice(); // 2018-01-29: display "apb" message
      Psy[tkbv].psyExam(); // 2018-01-27: expose all values to change one;
   Psy[tkbv] = new  // 2018-01-27: changing psi0=tru(th); psi3=act;
 psyNode(0,psi1,1,64,0,0,8,3,1,0,qusub,psi11,quobj,tkbo,0);  // 2018-10-11: 1=English
    }  // 2018-01-27: end of test for a "yes" answer.
    Psy[tkbn].psyExam(); // 2018-01-29: expose all values to change one;
    Psy[tkbn] = new // 2018-01-29: changing psi3=act; psi12=seq;
 psyNode(8,psi1,1,64,0,0,5,1,psi8,0,0,0,quverb,tkbv,0);  // 2018-10-11: 1 = English
    Psy[tkbo].psyExam(); // 2018-01-29: may cause "Error on page"?
    Psy[tkbo] = new // 2018-01-29: changing psi3=act; psi7=dba; psi10=pre;
  psyNode(0,psi1,1,64,0,0,5,4,0,0,quverb,0,0,0,0);  // 2018-10-11: hlc 1 = English
  }  // 2018-01-27: end of test for either yes or no.
  else {  // 2018-01-27: if neither;
  Psy[tkbn].psyExam(); // 2018-01-27: remove associative pre and seq tags from noun;
  Psy[tkbn] = new  // 2018-01-27: changing psi10=pre; psi12=seq.
 psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,0,psi11,0,psi13,psi14);
  Psy[tkbv].psyExam(); // 2018-01-27: remove associative pre and seq tags from verb;
  Psy[tkbv] = new  // 2018-01-27: changing psi10=pre; psi12=seq.
 psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,0,psi11,0,psi13,psi14);
  }  // 2018-01-27: end of else-clause.
  quobj = 0;  // 2018-01-29: reset for safety.
  tkbn = 0;   // 2018-01-27: reset for safety;
  tkbv = 0;   // 2018-01-27: reset for safety;
  PsiDecay()  // 2018-01-27: for distribution of PsiDecay influence;
}  // 2018-01-28: KbRetro() returns to EnThink()

module.exports = Retro;
