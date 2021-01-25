function Inference() {  // http://ai.neocities.org/InFerence.html
  moot = 1;  // prevent interference via tag-forming; 18mar2013
  apb = "If silent inference is made, answer question to confirm or refute.";
  Voice();  // 23mar2013
  if (prednom > 0) {  // positive predicate nominative? 18mar2013
    for (i = tpu; i>midway; i--) {  // 2018-01-25: search KB to infer facts.
      Psy[i].psyExam(); // 2018-01-25: examine Psy concept-array;
      // 20mar2013 Let only plural KB subjects be basis for InFerence:
      if (prednom == psi1 && psi8 == 2) {  // 2018-01-25: plural KB data?
        if (psi7 == 1) {  // 2018-01-25: dba nominative for subject?
          if (seqverb == 0) {  // only once; 18mar2013
            seqtkb = psi13;  // 2018-01-25: hold for fetching same direct object;
            seqverb = psi12;  // 2018-01-25: hold to be the verb of an inference.
            quverb = psi12;  // 2018-01-27: query-verb for AskUser;
            ynverb = 0;  // 2018-01-25: since lacking, use quverb for AskUser()
            seq = seqverb;  // 2018-01-25: to be inferred as applying to subject.
          }  // 2018-01-25: end of test that no "seqverb" has yet been declared.
        }  // 2018-01-25: end of test that "prednom" does occur in nominative.
      } // 2018-01-25: end of test for a fact about the "prednom" as plural subject.
    }  // 2018-01-25: end of backwards loop in search of inferrable knowledge.
  }  // 2018-01-25: end of test for positive predicate nominative.
  if (seqverb > 0) {  // verb available for inference? 18mar2013
    inft = t;  // for AskUser to find auditory engrams 18mar2013
    t = (t+1);  // increment time "t" by one for a gap; 18mar2013
    t = (t+1);  // increment time to create an inference; 18mar2013
    Psy[t].psyExam(); // 2018-01-25: expose row where no values are present;
    psi7 = 1;  // 2018-10-11: subject noun serves as 1=nominative
    psi8 = 1;  // 2018-10-11: assumed singular because of Is-A quality.
    seq = seqverb;  // prevent override? 18mar2013
    psi13 = (t+1);  // 2018-01-25: psi13=tkb, which is one unit later;
    Psy[t] = new  // 2018-01-25: psi1 subjnom; psi3 act; psi6 pos; psi8 qusnum; psi12 seq;
 psyNode(psi0,subjnom,psi2,48,psi4,psi5,5,1,1,0,psi10,psi11,seqverb,psi13,psi14);
    tkbn = t;  // 2018-01-28: conceptual array-time for subject-noun of AskUser query.
    t = (t+1);  // 2018-01-25: increment t for storage of inference-verb;
    Psy[seqtkb].psyExam(); // 2018-01-25: obtain dobseq from Psy array;
    dobseq = psi12;  // 2018-01-25: to serve as psi12 "seq" in next insertion;
    quobj = dobseq;  // 2018-01-25: so AskUser() will use the particular dir.obj.
    Psy[t].psyExam(); // 2018-01-25: expose values for change of some;
    Psy[t] = new  // 2018-01-25: psi1 seqverb; 6 pos; 10 pre; 12 dobseq; 13 tkb;
psyNode(psi0,seqverb,psi2,psi3,psi4,psi5,8,3,1,psi9,subjnom,psi11,dobseq,(t+1),psi14);
    tkbv = t;  // 2018-01-28: conceptual array-time for verb of AskUser query.
    t = (t+1);  // 2018-01-25: increment time to store direct object;
    tkbo = t;   // 2018-01-29: conceptual array-time for object-noun of AskUser query.
    Psy[seqtkb].psyExam(); // 2018-01-25: obtain seqdob from Psy array;
    seqdob = psi12;  // 2018-01-25: to serve as "psi1" in next insertion;
    seqrvx = psi14;  // 2018-01-25: to serve as "psi14" in next insertion;
    Psy[t].psyExam(); // 2018-01-25: expose values for change of some;
    Psy[t] = new  // 2018-01-25: psi1 seqverb; 6 pos; 10 pre; 12 dobseq; 13 tkb;
psyNode(psi0,seqdob,psi2,40,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,seqrvx);
    quobj = dobseq;  // 2018-01-25: for transfer to AskUser;
    t = (t+1);  // 2018-01-25: increment time "t" for an ending gap;
    yncon = 1;  // 2018-01-25: for AskUser() to ask yes-or-no question;
    qusub = subjnom;  // 2018-01-25: for transfer to AskUser();
  }  // 2018-01-25: end of test for a verb to be part of inference.
  becon = 0;  // 2018-01-25: reset after use;
  dobseq = 0;  // 2018-01-25: reset after use; 18mar2013
  moot = 0;  // 2018-01-25: reset after use; 18mar2013
  prednom = 0;  // 2018-01-25: reset after use; 18mar2013
  seqdob = 0;  // 2018-01-25: reset after use; 18mar2013
  seqrvx = 0;  // 2018-01-25: reset after use;
  seqtkb = 0;  // 2018-01-25: reset after use;
  seqverb = 0;  // 2018-01-25: reset after use;
  subjnom = 0;  // 2018-01-25: reset after use;
}  // 2018-01-25: InFerence() returns to EnThink()

module.exports = Inference;
