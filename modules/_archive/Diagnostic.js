function Diagnostic() {
  psiList();
  audList();
  if (trouble == true) {
    document.all.tabula.innerHTML = "";
    document.all.psicolumn.innerHTML = psidata;
    document.all.audcolumn.innerHTML = auddata;
   }
  html = "";
  psidata = ("<b>" + "Concepts with associative tags for ");  // 2018-01-16
  psidata += ("Natural Language Understanding:" + "<\/b>" + "<BR>");
  psidata += ("krt tru psi hlc act mtx jux pos dba num mfn pre iob seq tkb rv");
  auddata = ("<b>" + "Auditory memory nodes" + "<\/b>" + "<BR>");
  auddata += ("krt pho act audpsi"); // 2018-01-16
}


function HCI() {  // http://mind.sourceforge.net/hci.html
  if (document.all["cb3"].checked == true) {
    document.all["cb1"].checked = false;
    document.all.souvenir.innerHTML = "";
    document.all["cb2"].checked = false;
     tutor = false;
    trouble = true;
    fyi = 3;
  }
  if (document.all["cb3"].checked == false) {
    document.all.tabula.innerHTML = "";
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
    trouble = false;
  }
  if (document.all["cb1"].checked == true) {
    document.all["cb2"].checked = false;
     document.all["cb3"].checked = false;
    document.all.tabula.innerHTML = "";
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
    trouble = false;
    hardcopy = true;
    fyi = 1;
    now = new Date();
    adcopy=("AI Mind version "+vrsn+" on " +now);
    document.all.souvenir.innerHTML = adcopy;
  }
  if (document.all["cb1"].checked == false) {
    document.all.souvenir.innerHTML = "";
    hardcopy = false;
    document.all.tabula.innerHTML = "";
  }
  if (hardcopy == true) {
    if (userline != "" || output != "" ) {
      Transcript();
    }
  }
  if (document.all["cb2"].checked == true) {
    document.all["cb1"].checked = false;
    document.all.souvenir.innerHTML = "";
    hardcopy = false;
    document.all["cb3"].checked = false;
    document.all.tabula.innerHTML = "";
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
    trouble = false;
    tutor = true;
    fyi = 2;
  }
  if (document.all["cb2"].checked == false) {
    tutor = false;
    if (fyi == 2) fyi = 0;
  }
  if (trouble == true) {
    Diagnostic();
  }
  if (life == true) {
    document.forms[1].ear.focus();
  }
}  // 2018-01-21: HCI() returns to Security module.

module.exports = Diagnostic;
