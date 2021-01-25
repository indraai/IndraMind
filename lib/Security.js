function Security(_state) {
  Health(_state);
  Defense(_state).Offense(_state);

  HCI();  // 2018-01-18: Human Computer Interfact
  Voice();
  console.log('STATE: ', _state, 'PSI', psi);

  if (t > (cns-64)) ReJuvenate();

  if (t > 160)  nonce = vault;  // Diagnostic display of all thought.
  nonce = vault;  // for quicker loading; 25oct2012

  if (life == true) {
    // build security protocols for monitoring active agents.
    apb=`AI Mind at t${t} is alive on cyc #${rjc} since ${dob}`;
    if (t > (cns-32)) apb = `WARNING!  Consider clicking Refresh. Only ${cns-t}`;
  }
  else {
    // monitor for dead ghosts
    apb=("<font color='red'>"+"Mental function suspended."+"<\/font>");
  }
}

module.exports = Security;
