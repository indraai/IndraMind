function Rejuvenate() {  // http://ai.neocities.org/ReJuvenate.html
  edge = 0;  // When found, edge-of-thought becomes "1".
  istr = (vault + coda);  // 2018-10-13: initial calculation of "istr"
  rjc = (rjc+1);  // 2018-01-18: increment rejuvenation counter.
  if (rjc > 99999) rjc = 1;  // 2018-01-18: for immortal AI avoid infinite count.
  apb=("<font color='red'>"+"Rejuvenating; please wait!"+"<\/font>");
  Voice();  // Display the Voice:brain apb message.
  jrt = vault;  // 2018-10-12: let "jrt" increment after the "vault"
  for (i = istr; i < cns;  ++i) {  // 2018-10-13: loop forwards from initial "istr"
    if (edge == 0) {  // 2018-10-13: not yet set to unitary one.
      audMemory[i].audExam();  // 2018-10-13: examine auditory memory
      mg++;  // 2018-10-13: increment until "edge" is found.
      if (aud0 == "{") edge = 1;  // 2018-10-13: if "edge" of thought is found...
      if (aud0 == "{") istr = i;  // 2018-10-13: reset the "istr" starting-point.
      if (aud0 == "{") mg = (mg + coda - 1)  // 2018-10-13: distance from "vault"
      if (aud0 == "{") break;     // 2018-10-13: abandon the rest of the loop.
    }  // 2018-10-13: end of search for edge-of-thought "istr" starting-point.
  }  // 2018-10-13: end of loop looking for a first "edge" of thought.
    for (i = istr; i < cns;  ++i) {  // 2018-10-13: loop forwards from "istr" point.
    Psy[i].psyExam(); // 2018-01-18: subtracting coda from psi13 to keep tkb valid:
    if (psi13>0) psi13= (psi13 - mg);  // 2018-10-13: only for a concept-row.
    if (psi14>0) psi14= (psi14 - mg);  // 2018-10-13: only for a concept-row.
    Psy[jrt] = new
psyNode(psi0,psi1,psi2,psi3,psi4,psi5,psi6,psi7,psi8,psi9,psi10,psi11,psi12,(psi13),psi14);
    psi13 = 0;  // 2018-10-13: reset to prevent carry over.
    Psy[i] = new psyNode(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," ");
    audMemory[i].audExam();  // 2018-10-12: gain access to auditory engram nodes
    audMemory[jrt] = new audNode(aud0,aud1,aud2);  // 2018-10-12: move engrams back.
    audMemory[i] = new audNode(" ",0," ");  // 2018-10-12: zero out old time-row.
    jrt++;  // 2018-10-13: advance each "junior-time" point for a moved engram.
  }  // 2018-10-12: end of loop moving forwards while shifting engrams back.
  edge = 0;  // 2018-10-12: reset for next call of ReJuvenate()
  t = (jrt - mg);  // 2018-10-13: TEST
  mg = 0;  // 2018-10-13: reset to prevent carry-over.
  for (j = t; j < cns; ++j) {  // 2018-10-12: clean out engrams beyond current "t"
    audMemory[j] = new audNode(" ",0," ");  // 2018-01-18: pho(neme); act; audpsi
    Psy[j] = new psyNode(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," ");
  }  // 2018-10-12: end of sweep of memory beyond current time "t".
}  // 2018-01-18: End of ReJuvenate(); return to Security();

module.exports = Rejuvenate;
