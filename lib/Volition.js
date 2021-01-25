function Volition() {  // http://ai.neocities.org/Volition.html
  apb = "Volition has been called and life = "+life;  // 2018-01-21: more informative
  Voice();
// Emotion();  // 2018-03-17: so emotions may influence otherwise rational thought.
  if (life == true) {  // 2018-01-21: when user checks "Halt", stop thinking.
    EnThink(); // 2017-12-31: think in English.
  }  // 2018-01-21: end of test for "life" status.
// Motorium();  // 2018-03-17: so that emotion and thought may initiate actions.
} // 2018-01-20: FreeWill Volition() module returns to MainLoop()
module.expots = Volition;
