function NewConcept() {  // http://ai.neocities.org/NewConcept.html
  psi = nxt; // 2018-01-10: For xfer to Instantiate().
  qusub = nxt; // 2018-01-23: for sending new concept into SpreadAct()
  pos = bias;  // 2018-01-23: Instantiate() stores value from Parser().
  if (predflag == 1 && pos == 5) dba = 1;  // 2018-01-27: noun;
  if (pov == 2) {  // 2018-01-27: if new psi, probably external POV anyway;
    if (pos == 5) {  // 2018-01-27: if noun...
      dba = 1;  // 2018-01-27: nominative is a default at first;
    }  // 2018-01-27: end of test for noun or pronoun;
    if (pos == 8) {  // 2018-01-27: if part-of-speech is verb...
      dba = 3;  // 2018-01-27: third person is a default at first;
      if (subjprsn==1) dba = 1;  // 2018-01-27: 1st prsn I or WE;
      if (subjprsn==2) dba = 2;  // 2018-01-27: 2nd prsn 707=YOU;
      if (subjprsn==3) dba = 3;  // 2018-01-27: 3rd prsn;
    }  // 2018-01-27: end of test for input of a verb;
  }  // 2018-01-27: end of test for external POV.
  if (pos==5) num = audnum;  // 2018-01-27: pass for storage;
  if (pos==8) num = holdnum;  // 2018-01-27:
  if (pos==5) holdnum = audnum;  // 2018-01-27: transfer to verb.
  EnParser();  // 2018-01-10: In preparation to call Instantiate().
  if (pos == 5) {  // 2018-01-27: if noun
    cognum = instnum;  // 2018-01-27: from Instantiate;
    nucon = 1;  // 2018-01-27: for SpreadAct()
    qusub = psi;  // 2018-01-27: for SpreadAct()
    recon = 1;  // 2018-01-27:
    topic = nxt;  // 2018-01-27: potentially a query "topic";
  }  // 2018-01-27:
  if (pos == 8) quverb = nxt;  // 2018-01-27: for AskUser()
  if (pov == "2") {  // 2018-01-27: external pov during input?
    if (pos == 5) {  // 2018-01-27: nouns only, not pronouns;
      if (subjnom > 0) {  // 2018-01-27: already subjnom?
        // There may not be inferences from new prednoms:
        prednom = newpsi;  // 2018-01-27: infer from prednom;
      }  // 2018-01-27: end of test for pre-existing subjnom;
      if (prednom == 0) {  // 2018-01-27: subject-slot still open?
        subjnom = newpsi;  // 2018-01-27: grab for InFerence()
        subjnum = num;  // 2018-01-27: grab for AskUser()
        qusnum = num;  // 2018-01-27: query-subject-number for AskUser;
      }  // 2018-01-27: alternate between subjnon and prednom;
    }  // 2018-01-27: end of test for a noun;
  }  // 2018-01-27: end of test for external-input POV.
  audpsi = 0; // 2018-01-06: reset to prevent carry-overs.
  len = 0; // 2018-01-04: reset to avoid carry-over.
  oldpsi = 0;  // 2018-01-17: reset for safety
  PsiDecay();  // 2018-01-12: TEST; REMOVE
  if (kbcon > 0) {  // 2018-01-27: if user answers yes-or-no question;
  }  // 2018-01-27: User has had one chance to answer yes-or-no question.
  audrun = 0;  // 2018-01-15: reset for safety.
  prc = 0;  // 2018-01-17: reset for safety
  AudDamp();  // 2018-01-17: deactivate engrams from outside of AudInput()
}  // 2018-01-04: NewConcept() returns to AudInput().

module.exports = NewConcept;
