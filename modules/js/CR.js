function CR() {  // 2018-05-20: called from input Form if there is no input.
  document.forms[1].elements[0].value = "";
    if (trouble == true) Diagnostic();
  userline = inbuffer;
  inbuffer = "";
  spt = t;
  lastword = true;
  eot = 13; // for use in AudListen() to indicate CR.
  holdnum = 0;  // reset for safety;  4nov2012
  c = 32;   // as if SPACE-BAR "32" were pressed
  pho = " "; // 2018-01-17: TEST
  eot = 0;
  moot = 0;  // assuming end of moot user queries; 1nov2011
}

module.exports = CR
