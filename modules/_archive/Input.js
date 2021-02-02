function Input() {  // http://ai.neocities.org/Input.html
  iob = 0;  // 2018-01-21: reset indirect-object identifier for safety.
  spt = t;
  tio = 0;  // 2018-01-21: reset at level above EnParser() and Instantiate()
  if (doa > 31) t = (t + 1); // 2018-01-17: TEST
  if (doa == 13) {  // 2018-01-17: intercept 13=CR for sake of AudRecog().
    t = (t + 1); // 2018-01-19: prevent dropping last character of word?
    pho = " ";  // 2018-01-17: change 13=CR into SPACE for AudRecog().
    doa = 0;  // 2018-01-17: reset for immediate re-use.
  }  // 2018-01-17: end of test to insert SPACE upon carriage-return.
  if (doa > 32) {  // 2018-01-17: a holding of input character "c"
    len = (len + 1); // 2018-01-17:
    doa = 0;  // 2018-01-17: reset for immediate re-use.
  }  // 2018-01-17:
  if (audrun < 1) {  // 2018-01-19: until word starts
    rv = t;  // 2018-01-19: set recall-vector.
  }  // end of test for unitary length at start of word
  tult = (t - 1);
  AudMem()  // 2018-01-15: modernizing, call AudMem() instead of storing directly.
  if (pho == " " && rv > 1) audrun = 0;  // 2018-01-15: reset after word
 if (pho == " ") {  // 2018-01-17: decide on concept only at post-word SPACE...
  if (audpsi > 0) {   // 8dec2009 "audpsi" replacing "psi"
    aud = onset;
    oldpsi = audpsi;  // for conformance with MindForth; 3jul2011
    prc = 0; // reset provisional recognition at end of word; 14apr2013
    OldConcept();
    psi = 0;
    audpsi = 0;  // 8dec2009 de-globalizing "psi"
    aud = 0;
    dba = 0;  // From RuAi; reset for safety; 19oct2012
  } else {  // i.e., if AudRecog has not recognized word; 12may2011
    if (len > 0) {
      aud = onset
      audMemory[t].audExam(); // 2018-09-21: prepare to modify auditory engram.
      audMemory[t] = new audNode(" ",aud1,aud2); // 2018-09-21: store blank.
      NewConcept();  // Input() calls NewConcept(); 12may2011
      audMemory[tult].audExam(); // 2018-01-16: attach audpsi to word-stem.
      audpsi = nxt;  // 2018-09-21: concept-number for a new concept.
      if (aud2 == 0) {  // 2018-09-21; if audpsi-slot is empty...
        audMemory[tult] = new audNode(aud0,aud1,audpsi); // 2018-09-21: store audpsi
      }  // 2018-09-21: end of test for a blank slot to store "audpsi" number.
      audMemory[tult] = new audNode(aud0,aud1,audpsi); // 2018-01-19: absolute?
      audMemory[tult-1].audExam();  // 2018-01-16: in event of end-of-stem.
      audMemory[tult-1] = new audNode(aud0,aud1,aud2);  // 2018-01-15: modernizing
      audpsi = 0;  // 2018-01-19: restore to prevent carry-over.
      nxt++;  // 2018-01-19: increment here and not in moribund NewConcept()
    }  // end of test for positive len(gth); 14apr2013
  }
 }  // 2018-01-17: end of test for post-word SPACE.
  pos = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  pre = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  psi = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  len = 0;
  onset = 0;
  predflag = 0;  // prevent carry-over; 5dec2012
  aud = 0;
  newpsi = 0;  // from Forthminds Wotan and MindForth; 18mar2013
} // 2018-01-21: Input()) returns to AudListen(), CR() or ReEntry().

module.exports = Input;
