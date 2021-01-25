function ReEntry() {
  pov = 1;  // 2018-01-15: numeric code for internal POV.
  t = (t + 1);
  onset = (spt + 1);
  if (dirobj == 1) dba = 4;  // From RuAi; test; 19oct2012
  if (pho != " ") {  // 2018-01-15: if pho is not a 32=SPACE...
    len = (len +1);
    AudInput();  //
  }  // End of test that input "pho" is not a "space".
  if (pho == " ") { // 2018-01-15: If pho is a "space".
    AudInput();  // Re-entry into audition; 13jul2010
  }  // End of test for space-bar re-entry; 13jul2010
  pos = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  pre = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  psi = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
},

module.exports = ReEntry;
