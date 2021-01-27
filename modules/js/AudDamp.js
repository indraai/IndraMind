function AudDamp() {
  for (i = t; i > midway; --i) {
    audMemory[i].audExam();
    audMemory[i] = new audNode(aud0,0,aud2);
  }
}
module.exports = AudDamp;
