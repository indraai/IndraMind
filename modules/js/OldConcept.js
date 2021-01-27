function OldConcept() { // http://ai.neocities.org/OldConcept.html
  if (pov == 1) psi = oldpsi;  // 2018-01-27: for sake of AskUser.
  for (i=tpu; i>midway; --i) {  // 2018-01-11: from time-penultimate backwards...
    Psy[i].psyExam(); // 2018-01-11: examine the Psy concept array...
      if (psi1 == oldpsi) {  // 2018-01-11: if same concept found...
        if (psi6 > 0) pos = psi6;  // 2018-01-11: pos = part of speech
        if (psi9 > 0) mfn = psi9;  // 2018-01-11: mfn = male/femal/neuter gender.
      }  // 2018-01-11:
  }  // 2018-01-11:
  if (hlc != "ru") {  // 2018-01-23: test for governing human-language-code
    if (pov == "2") {  // 2018-01-25: Only during "2" external POV;
      if (oldpsi==800) becon = 1;  // 2018-01-25: flag for calling InFerence()
    }  // 2018-01-25: end of test for external POV.
    if (oldpsi == 800) tbev = (t-1);  // 2018-01-23: for be-verb negation.
    if (oldpsi == 250) {  // 2018-01-23: 250=NOT for negation of a verb.
      if (tbev > 0) {  // 2018-01-23: if positive be-verb time...
        Psy[tbev].psyExam();  // 2018-01-23: examine Psy array
        psi5 = 250;  // 2018-01-23: set "jux" of verb to 250=NOT for negation.
        Psy[tbev] = new  // 2018-01-23: insert [psi5]jux 250=NOT for negation of verb
  psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,psi13,psi14);
        tbev = 0;  // 2018-01-23: reset for safety.
      }  // 2018-01-23: end of test for a positive "tbev" time-of-be-verb.
    }  // 2018-01-23: end of test for negation of a verb with "NOT".
    if (oldpsi == 432) kbzap = 432;  // 2018-01-28: 432=YES for KbRetro()
    if (oldpsi == 404) kbzap = 404;  // 2018-01-28: 404=NO for KbRetro()
    psi = oldpsi;  // 2018-01-11: for transfer to Instantiate()
    if (pov == 2) {  // 2018-01-23: during a pov "dual" (you and I) conversation...
      if (oldpsi == 245) wherecon = 1;  // 2018-10-28: if "Where?"
      if (oldpsi == 245) prepgen = 8;  // 2018-01-23: if "Where?" call EnPrep()
      if (oldpsi == 707) { psi = 701; rv = 0 }  // 2018-01-23: interpret "YOU" as "I";
      if (oldpsi == 701) { psi = 707; rv = 0 }  // 2018-01-23: interpret "I" as "YOU".
      if (oldpsi == 731) { psi=737; num=2; dba=1; rv=0 } // 2018-01-23: we --> you.
    }  // 2018-01-23: end of test for other person communicating with the AI.
    if (oldpsi == 250) {  // 2018-06-11: upon recognition of 250=NOT;
      prejux = 250;  // 2018-06-11: flag for concept to be negated;
    }  // 2018-06-11: end of test for input or ReEntry of 250=NOT.
    if (pos==5) num = audnum;  // 2018-01-27:
    if (pos==8) num = holdnum;  // 2018-01-27:
    if (pos==5) holdnum = audnum;  // 2018-01-27: transfer to verb;
    EnParser(); // 2018-01-11: In preparation to call Instantiate().
  }  // 2018-01-23: end of test for English human-language-code
  if (pov == 2) {  // 2018-01-25: external pov during input;
    if (pos == 5) {  // nouns only, not yet pronouns; 18mar2013
      if (subjnom > 0) {  // already subjnom? 18mar2013
        prednom = oldpsi;  // for InFerence; 18mar2013
      }  // end of test for pre-existing subjnom; 18mar2013
      if (prednom == 0) {  // no prednom yet? 18mar2013
        subjnom = oldpsi;  // grab for InFerence; 18mar2013
        subjnum = num;  // grab for AskUser; 18mar2013
        qusnum = num;  // query-subject-number for AskUser; 28mar2013
      }  // alternate between subjnom and prednom; 18mar2013
    }  // end of test for a noun; 18mar2013
    if (pos == 8) {  // verb part-of-speech? 18mar2013
      if (oldpsi != 800) {  // other than be-verb? 18mar2013
        subjnom = 0;  // cancel out any subjnom; 18mar2013
      }  // end of test for a be-verb; 18mar2013
    }  // end of test for a verb; 18mar2013
  }  // end of test for external-input POV; 18mar2013
  audpsi = 0;  // 2018-01-06: prevent carry-over.
  audrec = 0;  // 2018-09-21: prevent carry-over.
  dba = 0;  // 2018-01-27: Reset to prevent carry-over.
  len = 0;  // 2018-01-04: reset to avoid carry-over.
  prc = 0;  // 2018-01-17: reset for safety
  oldpsi = 0;  // 2018-01-17: reset for safety
  PsiDecay();  // 2018-01-12: TEST; REMOVE
  audrun = 0;  // 2018-01-15: reset for safety.
  AudDamp();  // 2018-01-17: deactivate engrams from outside of AudInput()
  tbev = 0;   // 2018-06-12 BUGFIX: reset for safety;
}  // 2018-01-04: OldConcept() returns to AudInput().

module.exports = OldConcept;
