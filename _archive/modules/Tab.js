function Tab() {
  document.forms[1].ear.focus();
  fyi = (fyi + 1);
   if (fyi == 0)  {
    document.all.souvenir.innerHTML = "Cycling through display modes.";
    document.all["cb1"].checked = false;
    document.all["cb2"].checked = false;
    document.all["cb3"].checked = false;
    trouble = false;
   }
   if (fyi == 1)  {
    document.all["cb2"].checked = false;
    document.all["cb3"].checked = false;
    trouble = false;
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
    document.all["cb1"].checked = true;
   }
  if (fyi == 2) {
    document.all["cb1"].checked = false;
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
    document.all["cb3"].checked = false;
    trouble = false;
    document.all.souvenir.innerHTML = "Tutorial has been called.";
    document.all.tabula.innerHTML = "Watch the artificial mind think.";
    document.all["cb2"].checked = true;
    tutor = true;
  }
   if (fyi == 3)  {
    document.all["cb1"].checked = false;
    document.all["cb2"].checked = false;
    document.all.souvenir.innerHTML = "Diagnostic mode has been called.";
    document.all.tabula.innerHTML = "Diagnostic troubleshoot mode.";
    document.all["cb3"].checked = true;
    trouble = true;
   }
  if (fyi > 3) {
    document.all["cb1"].checked = false;
    document.all["cb2"].checked = false;
    document.all["cb3"].checked = false;
    trouble = false;
    document.all.psicolumn.innerHTML = "";
    document.all.audcolumn.innerHTML = "";
    document.all.souvenir.innerHTML = "Tab key changes display modes.";
    fyi = 0;
  }
  TID=window.setTimeout("CR();",1000);
}
module.exports = Tab;
