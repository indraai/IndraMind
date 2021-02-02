function Listen() {  // 2018-01-17: http://ai.neocities.org/Listen.html
  apb = "Calling Listen module; when done press [ENTER]";
  Voice();
  pos = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  pre = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  psi = 0;  // 2018-01-21: Reset to prevent Instantiate() carry-over.
  if (skip < 1) {
  Attention();
  }
  inert = 0;
  pov = 2;  // 2018-01-16: external-input point-of-view
  document.onkeypress = function (evt) {
    c = event.keyCode;
    doa = c;  // 2018-01-17: for purpose in AudInput.
    impetus = 0;  // 2018-09-21: upon user input, disincentivize Imperative()
    isolation = 0;  // 2018-10-03: upon user input, disincentivize Imperative()
    inert = 0;  // User input cancels "inert" status; 18oct2011
    lurk = 0;  // de-lurk if user enters datum; 29sep2010
    quiet = false;  // 2018-06-11: "quiet" of internal thought is interrupted.
    rsvp = 2000;  // 2018-05-20: set delay to wait for more user input.
    if (c == 63) alert("Please use no punctuation.");
    if (c == 27) {
      brain = false;  // 2018-01-16: not internal-brain thought?
      danger = false;
      freedom = false;
    }
    if (c == 27) {
      document.all["cb4"].checked = true;
      Shutdown();
    }
    if (c != 27) {  // 2018-01-15: reviving the AI
      if (life == false) {
        life = true;
        apb = ("AI alive again.");
        Voice();
      }
    }
    if (c == 13) {  // 2018-10-06: upon carriage-return, display new message:
  apb = "The first working AI Mind thinks with concepts connected by associative tags.";
      Voice();  // 2018-01-19: show the "apb" message on the screen
    }  // 2018-01-21: end of test to detect pressing the CR ENTER-key.
    if (c == 32 || c == 13) {  // space-bar or CR; 26mar2013
      OutBuffer();  // to right-justify word from AudBuffer
      c01=""; c02=""; c03=""; c04="";  // empty AudBuffer
      c05=""; c06=""; c07=""; c08="";  // 26mar2013
      c09=""; c10=""; c11=""; c12="";  // 26mar2012
      c13=""; c14=""; c15=""; c16="";  // 26mar2013
      phodex = 0;  // reset for AudBuffer; 29mar2012
      pho = " ";  // 2018-01-15: SPACE for AudRecog word-end recognition;
    }  // from Russian Dushka RuAi; 26mar2013
    pho = String.fromCharCode(c);
    if (hardcopy == true) {
      inbuffer += pho;  // 2018-01-20:  build up the input "userline".
    }
    if (eot == 13) {
      phodex = 0;  // reset for AudBuffer(); 25mar2013
    }
    if (c == 32) { // From CR or space-bar; 12jul2010.
      phodex = 0;  // Reset for AudBuffer; 25mar2013
    }  // End of expanded if-clause; 12jul2010.
    pho = pho.toUpperCase();
    abc = pho;  // From RuAi; for transfer to AudBuffer; 25mar2013
    if (c > 32) AudBuffer();  // to transfer engrams; 26mar2013
    if (bias == 5) {  // If expecting a noun; 27may2011
      if (c == 83 || c == 115) { // "s" or "S"; 27may2011
        audnum = 2;  // Set num(ber) to plural; 4nov2012
      }  // End of test for "s" or "S"; 27may2011
      if (c > 0) {  // Disregard empty pho; 27may2011
        if (c != 32) {  //  Disregard SPACE; 27may2011
          if (c != 13) {  // Disregard CR; 27may2011
            if (c != 115) {  // If not "s"; 27may2011
              if (c != 83) {  // If not "S"; 27may2011
                audnum = 1;  // Assume singular;  4nov2012
              }  // If last letter not "S"; 27may2011
            }  // If last letter not "s"; 27may2011
          }  // End of test for carriage-return; 27may2011
        }  // End of test for SPACE; 27may2011
      }  // End of test for empty pho; 27may2011
    }  // End of test for bias towards a noun; 27may2011
    onset = (spt + 1);
    AudInput();  // 2018-01-19: consolidating
    c = " ";
    pho = " ";
    return true;
  }
}  // End of event-driven Listen(); 4nov2012

module.exports = Listen;
