// http://ai.neocities.org/OutBuffer.html
function OutBuffer() {  // for manipulation of SpeechAct words; 4jan2012
  b01=" "; b02=" "; b03=" "; b04=" "; b05=" "; b06=" ";  // 2018-09-04
  b07=" "; b08=" "; b09=" "; b10=" "; b11=" "; b12=" ";  // 2018-09-04
  b13=" "; b14=" "; b15=" "; b16=" ";  // 2018-09-04: clear tabula rasa;
  if (c16>"") {  // if the AudBuffer full; 4jan2012
    b16=c16; b15=c15; b14=c14; b13=c13; b12=c12; b11=c11;
    b10=c10; b09=c09; b08=c08; b07=c07; b06=c06; b05=c05;
    b04=c04; b03=c03; b02=v02; b01=c01;  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 16-character word; 4jan2012
  if (c15>"") {
    b16=c15; b15=c14; b14=c13; b13=c12; b12=c11; b11=c10;
    b10=c09; b09=c08; b08=c07; b07=c06; b06=c05; b05=c04;
    b04=c03; b03=c02; b02=c01; b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 15-character word; 4jan2012
  if (c14>"") {
    b16=c14; b15=c13; b14=c12; b13=c11; b12=c10; b11=c09;
    b10=c08; b09=c07; b08=c06; b07=c05; b06=c04; b05=c03;
    b04=c02; b03=c01; b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 14-character word; 4jan2012
  if (c13>"") {
    b16=c13; b15=c12; b14=c11; b13=c10; b12=c09; b11=c08;
    b10=c07; b09=c06; b08=c05; b07=c04; b06=c03; b05=c02;
    b04=c01; b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 13-character word; 4jan2012
  if (c12>"") {
    b16=c12; b15=c11; b14=c10; b13=c09; b12=c08; b11=c07;
    b10=c06; b09=c05; b08=c04; b07=c03; b06=c02; b05=c01;
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function;
  }  // end of transfer of a 12-character word; 4jan2012
  if (c11>"") {
    b16=c11; b15=c10; b14=c09; b13=c08; b12=c07; b11=c06;
    b10=c05; b09=c04; b08=c03; b07=c02; b06=c01; b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of an 11-character word; 4jan2012
  if (c10>"") {
    b16=c10; b15=c09; b14=c08; b13=c07; b12=c06; b11=c05;
    b10=c04; b09=c03; b08=c02; b07=c01; b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 10-character word; 4jan2012
  if (c09>"") {
    b16=c09; b15=c08; b14=c07; b13=c06; b12=c05; b11=c04;
    b10=c03; b09=c02; b08=c01; b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 9-character word; 4jan2012
  if (c08>"") {
    b16=c08; b15=c07; b14=c06; b13=c05; b12=c04; b11=c03;
    b10=c02; b09=c01; b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of an 8-character word; 4jan2012
  if (c07>"") {
    b16=c07; b15=c06; b14=c05; b13=c04; b12=c03; b11=c02;
    b10=c01; b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 7-character word; 4jan2012
  if (c06>"") {
    b16=c06; b15=c05; b14=c04; b13=c03; b12=c02; b11=c01;
    b10="";  b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 6-character word; 4jan2012
  if (c05>"") {
    b16=c05; b15=c04; b14=c03; b13=c02; b12=c01; b11="";
    b10="";  b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 5-character word; 4jan2012
  if (c04>"") {
    b16=c04; b15=c03; b14=c02; b13=c01; b12="";  b11="";
    b10="";  b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 4-character word; 4jan2012
  if (c03>"") {
    b16=c03; b15=c02; b14=c01; b13=""; b12="";  b11="";
    b10="";  b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 3-character word; 4jan2012
  if (c02>"") {
    b16=c02; b15=c01; b14="";  b13=""; b12="";  b11="";
    b10="";  b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 2-character word; 4jan2012
  if (c01>"") {
    b16=c01; b15=""; b14="";  b13=""; b12="";  b11="";
    b10="";  b09="";  b08="";  b07="";  b06="";  b05="";
    b04="";  b03="";  b02="";  b01="";  // 4jan2012
    return;  // abandon remainder of function; 4jan2012
  }  // end of transfer of a 1-character word; 4jan2012
}  // end of OutBuffer(); return to AudListen() or VerbGen().

modules.export = OutBuffer;
