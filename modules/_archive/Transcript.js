function Transcript() {
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
  Transcribe();
  if (hardcopy == true) {
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
  }
  document.all.tabula.innerHTML = dialog;
  if (document.all["cb1"].checked == false) {
    document.all.souvenir.innerHTML = "";
    hardcopy = false;
    document.all.tabula.innerHTML = "";
  }
  if (hardcopy == false) html = "";
};
module.exports = Transcript;
