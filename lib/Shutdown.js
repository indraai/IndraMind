Shutdown() {
  if (document.all["cb4"].checked == true) {
    life = false;
    apb = "You have halted the AI Mind at Rejuvenation cycle #"+rjc+".";
    Voice();
  }
  if (document.all["cb4"].checked == false) {
    life = true;
    document.forms[1].ear.focus();
    TID=window.setTimeout("MainLoop();",1000);
  }
},
module.exports = Shutdown;
