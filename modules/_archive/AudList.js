function AudList() {
  for (i = nonce; i < (t +1); i++) {
    audMemory[i].audExam();
    if (aud0 == " ") aud1 = " ";
    auddata += ("<BR>" + i + ". <b>"+aud0+ "<\/b> "+aud1+" "+aud2); // 2018-01-06
  }
}
module.exports = AudList;
