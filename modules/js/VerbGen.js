function VerbGen() {  // http://ai.neocities.org/EnVerbgen.html
  if (audbase == 0 && verbpsi > 0) {  // 2018-10-11: for lack of starting point..
    for (i = tpu; i>midway; --i) {  // 2018-10-11: search backwards
      Psy[i].psyExam(); //  2018-10-11: examine conceptual Psy array at each "i(ndex)"
      if (psi1 == verbpsi && psi14 > 0) {  // 2018-10-11: verb with recall-vectoer?
        audbase = psi14;  // 2018-10-11: initial base-time for generating verb-form
        break;  // 2018-10-11: one example is enough.
      }  // 2018-10-11: end of test for modificand verb and auditory engram
    }  // 2018-10-11: end of backwards loop in search of audbase starting point.
  }  // 2018-10-11: end of search for "audbase" starting point.
  binc = 0;  // 2018-10-12: "b" buffer-character increment for AudBuffer()
  if (subjpsi==701) prsn = 1;  // 2018-10-11: "701=I" is first-person;
  if (subjpsi==707) prsn = 2;  // 2018-10-11: "707=YOU" is second-person;
  if (subjpsi==713) prsn = 3;  // 2018-10-11: "713=HE" is third-person;
  if (subjpsi==719) prsn = 3;  // 2018-10-11: "719=SHE" is third-person;
  if (subjpsi==725) prsn = 3;  // 2018-10-11: "725=IT" is third-person;
  if (subjpsi==731) prsn = 1;  // 2018-10-11: "731=WE" is first-person;
  if (subjpsi==743) prsn = 3;  // 2018-10-11: "743=THEY" is third-person;
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #01
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #02
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #03
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #04
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #05
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #06
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #07
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #08
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #09
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #10
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #11
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #12
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #13
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #14
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #15
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  audMemory[audbase].audExam();  // 2018-10-10: @ear character-engram #16
  if (aud0 != " ") { abc = aud0; AudBuffer(); audbase++ }  // 2018-10-10
  do {  // 2018-10-11: next loop uses OutBuffer();
    OutBuffer();  // 2018-10-11: call OutBuffer with each passage through loop;
    if (binc == 1) {  // 2018-10-11: the indicated buffer-character by number
      if (b01 != "") output += b01;  // 2018-10-11: concatenate verb-characters
      pho = b01;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 2) {  // 2018-10-11: the indicated buffer-character by number
      if (b02 != "") output += b02;  // 2018-10-11: concatenate verb-characters
      pho = b02;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 3) {  // 2018-10-11: the indicated buffer-character by number
      if (b03 != "") output += b03;  // 2018-10-11: concatenate verb-characters
      pho = b03;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 4) {  // 2018-10-11: the indicated buffer-character by number
      if (b04 != "") output += b04;  // 2018-10-11: concatenate verb-characters
      pho = b04;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 5) {  // 2018-10-11: the indicated buffer-character by number
      if (b05 != "") output += b05;  // 2018-10-11: concatenate verb-characters
      pho = b05;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 6) {  // 2018-10-11: the indicated buffer-character by number
      if (b06 != "") output += b06;  // 2018-10-11: concatenate verb-characters
      pho = b06;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 7) {  // 2018-10-11: the indicated buffer-character by number
      if (b07 != "") output += b07;  // 2018-10-11: concatenate verb-characters
      pho = b07;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 8) {  // 2018-10-11: the indicated buffer-character by number
      if (b08 != "") output += b08;  // 2018-10-11: concatenate verb-characters
      pho = b08;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 9) {  // 2018-10-11: the indicated buffer-character by number
      if (b09 != "") output += b09;  // 2018-10-11: concatenate verb-characters
      pho = b09;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 10) {  // 2018-10-11: the indicated buffer-character by number
      if (b10 != "") output += b10;  // 2018-10-11: concatenate verb-characters
      pho = b10;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 11) {  // 2018-10-11: the indicated buffer-character by number
      if (b11 != "") output += b11;  // 2018-10-11: concatenate verb-characters
      pho = b11;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 12) {  // 2018-10-11: the indicated buffer-character by number
      if (b12 != "") output += b12;  // 2018-10-11: concatenate verb-characters
      pho = b12;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 13) {  // 2018-10-11: the indicated buffer-character by number
      if (b13 != "") output += b13;  // 2018-10-11: concatenate verb-characters
      pho = b13;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 14) {  // 2018-10-11: the indicated buffer-character by number
      if (b14 != "") output += b14;  // 2018-10-11: concatenate verb-characters
      pho = b14;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 15) {  // 2018-10-11: the indicated buffer-character by number
      if (b15 != "") output += b15;  // 2018-10-11: concatenate verb-characters
      pho = b15;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    if (binc == 16) {  // 2018-10-11: the indicated buffer-character by number
      if (b16 != "") output += b16;  // 2018-10-11: concatenate verb-characters
      pho = b16;  // 2018-10-11: for ReEntry()
      if (pho > "") ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of outputting character and concatenating for ReEntry().
    binc++;  // 2018-10-11: TEST; REMOVE
    pho = aud0;  // 18oct2012
    abc = aud0;  // for AudBuffer(); 18oct2012
  }  // 2018-10-11: end of looping through OutBuffer().
  while (binc < 17);  // 2018-10-11: while inspecting OutBuffer;
  c01=""; c02=""; c03=""; c04=""; c05=""; // 2018-10-11
  c06=""; c07=""; c08=""; c09=""; c10=""; // 2018-10-11
  c11=""; c12=""; c13=""; c14=""; c15=""; // 2018-10-11
  c16="";  // 2018-10-11: clear out the AudBuffer.
  if (prsn == 1) {  // 2018-10-12: first person;
    if (snu == 1)  {  // 2018-10-12: subject-number parameter;
     ReEntry();  // 2018-10-12: for accumulating record of thought
    }  // 2018-10-12: end of test for singular subject-number;
    if (snu == 2)  {  // 2018-10-12: subject-number parameter;
     ReEntry();  // 2018-10-12: for accumulating record of thought
    }  // 2018-10-12: end of test for plural subject-number;
  }  // 2018-10-12: end of test for first person.
  if (prsn == 2) {  // 2018-10-12: second person;
    if (snu == 1)  {  // 2018-10-12: subject-number parameter;
     ReEntry();  // 2018-10-12: for accumulating record of thought
    }  // 2018-10-12: end of test for singular subject-number;
    if (snu == 2)  {  // 2018-10-12: subject-number parameter;
     ReEntry();  // 2018-10-12: for accumulating record of thought
    }  // 2018-10-12: end of test for plural subject-number;
  }  // 2018-10-12: end of test for second person.
  if (prsn == 3) {  // 2018-10-11: third person;
    if (snu == 1)  {  // 2018-10-11: subject-number parameter;
      if (b15 == "C" && b16 == "H") {  // last two characters in verb-stem
      pho = "E";  // 2018-10-11: add an "E" before "S"
      output += pho;  // 2018-10-11: inflection
      ReEntry();  // 2018-10-11: for accumulating record of thought
      }  // 2018-10-11: end of test for verb ending in "-ch"
      if (b15 == "S" && b16 == "H") {  // last two characters in verb-stem
      pho = "E";  // 2018-10-11: add an "E" before "S"
      output += pho;  // 2018-10-11: inflection
      ReEntry();  // 2018-10-11: for accumulating record of thought
      }  // 2018-10-11: end of test for verb ending in "-sh"
      pho = "S";  // 2018-10-11: add one single "S"
      output += pho;  // 2018-10-11: inflection
      ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-11: end of test for singular subject-number;
    if (snu == 2)  {  // 2018-10-12: subject-number parameter;
      ReEntry();  // 2018-10-11: for accumulating record of thought
    }  // 2018-10-12: end of test for plural subject-number;
  }  // 2018-10-11: end of test for third-person.
  output += " ";  // add a space; 18oct2012
  Voice();  // 18oct2012
  audbase = 0;  // 2018-10-11: prevent carry-over
  gencon = 1;   // 2018-10-10: to prevent unwarranted calling of Speech()
  prsn = 0;     // 2018-10-11: prevent carry-over
  verbpsi = 0;  // 2018-10-11: prevent carry-over
}  // 2018-10-10: EnVerbGen() returns to EnVerbPhrase()

module.exports = VerbGen;
