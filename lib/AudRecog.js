function AudRecog() {  // http://ai.neocities.org/AudRecog.html
  if (audrun == 0 && pho == " ") audrun = 0;  // 2018-01-08: non-increment here only.
  if (pho=="A"||pho=="B"||pho=="C"||pho=="D"||pho=="E"||pho=="F") audrun++; // 2018-01-07
  if (pho=="G"||pho=="H"||pho=="I"||pho=="J"||pho=="K"||pho=="L"||pho=="M") audrun++;
  if (pho=="N"||pho=="O"||pho=="P"||pho=="Q"||pho=="R"||pho=="S"||pho=="T") audrun++;
  if (pho=="U"||pho=="V"||pho=="W"||pho=="X"||pho=="Y"||pho=="Z") audrun++; // 2018-01-07
  len = audrun;  // 2018-01-17: TEST
   if (pho != 0 && pho != 13 && pho != 32 && pho != " ") {  // 2018-01-15
    if (audrec > 0) {  // 2018-01-05: if positive audrec before end of word...
      if (pho != 83) {  // 2018-01-05: keep audrec if current pho is 83=S
        if (audrec > 0) prc = audrec;  // 2018-09-21: preserve non-final $audrec
        audrec = 0; // 2018-01-05: zero out non-final audrec.
      }  // 2018-01-05: end of test for final "S" as inflectional ending.
    }  // 2018-01-05: end of test for audrec before word-end
  }  // 2018-01-05: end of test for an alphabetic character.
  if (pho == 13 || pho == 32 || pho == " ") {  // 2018-01-17: if 13=CR or 32=SPACE...
    if (audrec > 0) {  // 2018-01-05: if positive audrec before 32=SPACE...
      audpsi = audrec;  // 2018-0q-05: recognized item becomes storage item.
    }  // 2018-01-05: end of test for a positive audrec before 32=SPACE.
  }  // 2018-01-05: end of test for a non-alphabetic character after a word.
  for (i=t; i>midway; i--) { // 2018-10-14: prevent misrecognition of new concepts.
    if (pho != " ") {  // 2018-01-08: if not SPACE " "...
       audMemory[i].audExam(); // 2018-01-05: examine contents of auditory memory.
      if (aud0 != pho) audMemory[i] = new audNode(aud0,0,aud2); // 2018-01-05:
       if (pho == aud0) {  // 2018-01-05: if incoming pho matches stored aud0...
        if (aud1 == 0) {  // 2018-01-05: if matching engram has no activation;
          if (audrun < 2) {  // 2018-01-08: i.e., if audrun is number one...
            audMemory[i-1].audExam(); // 2018-01-05: examine previous row
            if (aud0==13 || aud0==32 || aud0==" ") {  // 2018-01-05: if 13=CR or 32=SPACE...
              if (audrun < 2) {  // 2018-01-05: if comparing start of a word..
                audMemory[i+1].audExam(); // 2018-01-07: examine Next-In-\Line char...
                if (aud0 != " ") {  // 2018-01-08: if not SPACE " "
                  audMemory[i+1] = new audNode(aud0,8,aud2); // 2018-01-05: activate N-I-L
                }  // 2018-01-05: end of test for continuation of stored comparand.
                audMemory[i].audExam(); // 2018-01-05: examine current character
                if (aud2 > 0) {  // 2018-01-05: if concept number present...
                  prc = aud2;  // 2018-01-05: provisional recognition
                }  // 2018-01-05: end of test for potential monopsi ultimate-tag
              }  // 2018-01-05: end of test for audrun=1 start of word.
            }  // 2018-01-05: end of test for a beginning non-active aud0.
          }  // 2018-01-08: end of test for first audrun.
        }  // 2018-01-05: "end of test for matching aud0 with no activation"
        audMemory[i].audExam(); // 2018-01-05: examine current character
        if (aud1 > 0) {  // 2018-01-05: If aud0 has activation, matching or not.
          if (aud2 > 0) prc = aud2;  // 2018-01-09: TEST; REMOVE
            audMemory[i+1].audExam(); // 2018-01-05: examine next-in-line char...
          if (aud0 == pho) {  // 2018-01-08: if matches specific pho now coming in...
            audMemory[i+1] = new audNode(aud0,8,aud2); // 2018-01-05: activate N-I-L
          }  // 2018-01-05: end of match-test
          if (aud0=" ") {  // 2018-01-08: if engram is SPACE " "
            if (aud1 > 0) {  // 2018-01-08: TEST for activation
              if (aud2 > 0) {  // 2018-01-08: if engram has concept number
                prc = aud2;  // 2018-01-08: provisional recognition of a stem
              }  // 2018-01-05: end of test for positive audpsi
            }  // 2018-01-05: end of test for activation.
            if (pho == " ") {  // 2018-01-08: if blank input
              if (audrec > 0) {  // 2018-01-05: if an audrec has been found...
               audpsi = audrec; // 2018-01-05: send audpsi into AudMem()
              }  // 2018-01-05: end of test for a positive audrec
            }  // 2018-01-05: end of test for 13=CR or 32=SPACE
            if (pho != " ") {  // 2018-01-08: if non-blank input
              audMemory[i+1].audExam(); // 2018-01-05: examine next-in-line char...
            if (aud0 != " ");  // 2018-01-08: if not a blank SPACE...
              audMemory[i+1] = new audNode(aud0,8,aud2); // 2018-01-05: activate N-I-L
            }  // 2018-01-08: since next engram is a letter...
          } // 2018-01-08: end of test for 32-SPACE after input word.
        }  // 2018-01-08: "End of test for matching aud0 with activation."
      }  // 2018-01-08: End of test for a character matching "pho".
    }  // 2018-01-08: end of test for alphabet letter
  }  // 2018-01-05: End of backwards search through auditory memory.
  if (audrec > 0) audpsi = audrec;  // 2018-01-06: hand-off for storage in AudMem()
  if (prc > 0) {  // 2018-01-09: expanding code to include a reset of "prc".
    audrec = prc;  // 2018-01-05: provisional recognition becomes actual.
    prc = 0;  // 2018-01-09: reset to prevent carry-over.
  }  // 2018-01-09: end of test for a positive "prc".
 } // 2018-01-05: End of AudRecog(); return to AudMem()

module.exports = AudRecog;
