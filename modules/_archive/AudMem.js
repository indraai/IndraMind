function AudMem() {  // http://ai.neocities.org/AudMem.html
  if (pov == 1) {  // 2018-01-19: during AI output
    input = "";  // 2018-01-19: reset while pov = 1.
  }  // 2018-01-19: end of test for pov=1 internal thinking.
  if (pov == 2) {  // 2018-01-19: during user input
    input += pho;  // 2018-01-19: increment the string of "input"
  }  // 2018-01-19: end of test for pov=2 user input
  if (pho == 32) pho = "";  // 2018-01-07: for storage
  audMemory[t] = new audNode(pho,0,0); // 2018-01-05: audpsi not yet stored.
  AudRecog();  // 2018-01-05: send SPACE or character to AudRecog()
  if (audpsi > 0) {  // 2018-01-05: if there is a recognized audpsi
    if (t > vault) {  // 2018-01-05: during normal time beyond MindBoot vault...
      audMemory[t-1].audExam();  // 2018-01-06: activate the variables before storing.
      audMemory[t-1] = new audNode(aud0,0,audpsi); // 2018-01-05: store before 32=SPACE.
      if (aud0=="S") { // 2018-09-21: if word ends in "S" like a plural...
        if (nucon==1) qusubnum = 2;  // 2018-10-03: for SpreadAct()
        audMemory[t-2].audExam();  // 2018-09-21: go back one line earlier.
        audMemory[t-2] = new audNode(aud0,0,audpsi); // 2018-09-21: store back one space.
      }  // 2018-09-21: end of test for "S" possibly indicating an inflection.
    }  // 2018-01-05: end of test for time past "vault" of MindBoot.
  }  // 2018-01-05: end of test for recognized word.
} // 2018-01-05: AudMem() returns to AudInput().

module.exports = AudMem;
