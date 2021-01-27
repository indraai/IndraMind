class Think {
  constructor(client) {
    this.client = client;
  }
  Process(state) {
    return Promise.resolve([
      {'preposition': 0},
      {'timeDirect': 0},
      {'timeKnowledge': 0},
      {'inert': state.inert + 1},
      {'impetus': state.thinking > 60 ? 0 : state.impetus},
      {'thinking': state.thinking++},
      {'alert': `Thinking @ ${state.time} | cycles:${state.cycles} | dob: ${state.dob}`},

    ])
  }
}
// Imperative();  // 2018-09-21: Issue a request for input from a human user.
// if (qucon==1 || whatcon==1 || wherecon==1) SpreadAct();  // 2018-10-28:

module.exports = Think;

function Think() {  // http://ai.neocities.org/EnThink.html
  prep = 0;  // 2018-11-13: in case "prep" was set by EnParser()
  tdo = 0;      // 2018-07-12: reset time-of-direct-object for safety.
  tkb = 0;  // 2018-07-12: reset for safety.
  inert = (inert + 1);  // 2018-01-20: but AudListen() resets to zero;
  lurk = (lurk + 1);    // 2018-01-20: AudListen() resets to zero;
  if (isolation > 60) {  // 2018-11-14: if no input for arbitrary duration...
    Imperative();  // 2018-09-21: Issue a request for input from a human user.
    impetus = 0;   // 2018-09-21: reset the trigger for calling Imperative().
    isolation = 0; // 2018-10-03: reset the trigger for calling Imperative().
    return;  // 2018-09-21: abandon EnThink(); give human user a chance to respond.
  }  // 2018-09-21: end of test for trigger to call Imperative()
  if (qucon==1 || whatcon==1 || wherecon==1) SpreadAct();  // 2018-10-28:
  Voice();  // 2018-01-20: speak the all-points-bulletin "apb";
  if (kbcon > 0) {  // 2018-01-28: if user answers yes-or-no question;
    KbRetro();  // 2018-01-28: retroactively adjust knowledge base;
    kbcon = 0;  // 2018-01-28: reset for safety;
    kbzap = 0;  // 2018-01-28: reset for safety.
  }  // 2018-01-28: User has had one chance to answer yes-or-no question.
  inft = t;  // 2018-01-25: in case inference-time not otherwise set;
  if (becon == 1) {  // 2018-01-25: if user input includes 800=BE-verb...
    InFerence(); // 2018-01-25: make a silent inference;
  }  // 2018-01-25: end of test for incoming be-verb.
  if (yncon == 1) {  // 2018-01-25: set in the InFerence() module
    tdo = 0;  // 2018-07-12: prevent carry-over.
    AskUser();  // 2018-01-25: for yes-or-no query;
    return;  // 2018-01-25: abandon the rest of EnThink()
  }  // 2018-01-25: end of test to trigger asking a question.
  abort = false;  // 2018-01-20:
  document.all.cosmos.innerHTML = ""; // 2018-01-04: blank out lower screen.
  if (nucon > 0) {  // 2018-01-23: if a new noun is encounter in NewConcept()
    SpreadAct();  // 2018-01-23: to activate concepts for a question.
    nucon = 0;    // 2018-01-23: reset for safety.
    pov = 2;      // 2018-01-23: give human user a "pause" for input...
    return;  // 2018-01-23: after question abandon rest of function.
  }  // 2018-01-23: end of test for the condition of input of a new concept.
  if (quiet == true || quiet == false) {  // 2018-06-11: temporary laissez-faire...
    pov = "1";  // 2018-01-20: internal point-of-view for thinking.
    output = "";  // blank out the output of the previous thought;
    outputplus = "";  // blank out the display of the previous thought.
    t = (t + 1);  // 2018-10-14: skip one time-point before edge="{"
    audMemory[t].audExam();  // 2018-10-12: ReJuvenate test;
    audMemory[t] = new audNode("{",aud1,aud2); // 2018-10-12
    Indicative();  // 2018-01-20: think in the indicative mood.
  } // 2018-01-20: // 2018-01-20: end of test for absence of user input.
  ConJoin();  // 2018-05-13: Output one more idea with sufficient activation.
// if (whatcon==1 && conj > 0) {  // 2018-06-03: for a conjoined idea...
  if (conj > 0) {  // 2018-10-06: for a conjoined idea...
    whatcon = 0;  // 2018-05-13: reset to prevent run-on thoughts.
    Indicative();  // 2018-05-13: think in the indicative mood.
  }  // 2018-05-13: end of whatcon-test in favor of subordinate clause.
  if (rsvp > -1) {  // 2018-05-20: and if there is no input...
    rsvp = (rsvp - 100);  // 2018-05-20: recrement rsvp-wait in absence of input
    if (rsvp < 0) rsvp = 0;  // 2018-05-20: disallow negative "rsvp".
  }  // 2018-05-20: end of test for lack of input as reason to speed up thinking.
  for (i = 1; i<(rsvp+100); i++) {  // 2018-05-20: delay for user to respond to output
  if (i > 1) { apb = "Rejuvenations = "+rjc+ "; time = "+t+"; isolation = "+isolation; Voice() }
  }  // 2018-05-20: end of delay to give time for user input.
  conj = 0;  // 2018-06-03: prevent carry-over.
  quiet = true;  // 2018-06-11: after AI responds to input, things quiet down.
  subjnom = 0;  // 2018-06-11: prevent carry-over.
  tpu = t;  // 2018-10-02: time-pen-ultimate -- before new input.
} // 2018-01-20: EnThink() returns to the FreeWill Volition() module.

module.export = Think;
