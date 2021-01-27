function Transcribe() {
  if (hardcopy == true) {
    dialog += ("<P>Robot: " + output);
    dialog += ("<BR>Human: <b>" + userline + '<\/b>');
    output = "";
    userline = "";
  }
}
module.exports = Transcribe;
