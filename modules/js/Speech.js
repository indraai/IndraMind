function Speech() {  // http://ai.neocities.org/Speech.html
  audstop = 0;  // 2017-12-31: Initially false value of flag
  pov = 1;  // 2017-12-31: only internal POV thinking uses Speech module.
  t2s = aud;  // 2017-12-31: start from the auditory recall-vector "aud"
  for (i = 0; i < 41; i++) {  // 2018-01-13: assume word no longer than 40 ch.
    if(audMemory[t2s]) audMemory[t2s].audExam();  // 2017-12-31: expose ear-array values at "t2s".
    pho = aud0;  // 2018-01-03: for re-entry; TEST; REMOVE?
    output += aud0;  // 2017-12-31: concatenate each engram to "output".//
    if (pho == " ") {  // 2017-12-31: if space detected...
      pho = " ";  // 2017-12-31: blank SPACE-32
      audstop = 1;  // 2017-12-31: flag to end a word with a space
    }  // 2017-12-31: end of test for a blank space.
    if (pho == 13) {  // 2017-12-31:  including any 32=SPACE...
      lastpho = pho;  // 2017-12-31: to avoid extra "S" on verbs
    }  // 2017-12-31: end of constantly keeping track of last pho.
    if (pho == 0 || pho == 13 || pho == 32 || pho == " ") {  // 2018-01-13: SPACE
      audstop = 1;   // 2017-12-31: flag for finding end of word
      spacegap = 1;  // 2017-12-31: identify presence of a space
    }  // 2017-12-31: end of test for 13=CR or 32=SPACE.
    ReEntry();  // 2018-01-15: from the obsolete JSAI
    if (audstop == 1) {  // 2017-12-31: flag found for end of word?
      if (spacegap == 1) {  // 2017-12-31: space found
        pho = " ";  // 2017-12-31: send SPACE-32 into AudInput?
        len = 0;  // 2018-01-06: at end of word, reset length "len"
        spacegap = 0;  // 2017-12-31: reset
      }  // 2017-12-31: end of test for a space.
      return;  // 2018-01-13: from MindForth ("LEAVE"
    }  // 2017-12-31: end of test for end-of-word flag.
    pov = 1;  // 2017-12-31: internal point-of-view during thinking.
    t2s = (t2s + 1);  // 2017-12-31: Increment time-to-speech to advance thru memory.
    if (aud0 == " ") {  // 2017-12-31: if no character is found
      audrv = t2s;  // 2017-12-31: Prepare for next word in memory.
      if (pho == 13 || pho == " ") pov = 2;  // 2018-01-13: for sake of pause-counter
      return;  // 2018-01-13: TEST
    }  // 2017-12-31: end of test for no character found.
  } while ( t2s != cns );  // 2017-12-31:  Show the whole array of AI Mind memory.
  phodex = 1;  // 2017-12-31: reset for AudBuffer()
  output += " ";
  Voice();
}  // 2017-12-31: End of Speech()

module.exports = Speech;
