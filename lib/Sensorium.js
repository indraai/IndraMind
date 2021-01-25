function Sensorium() {  // http://ai.neocities.org/Sensorium.html
  len = 0;  // 2018-01-03:
  verbcon = 0;  // 2018-07-12 BUGFIX: prevent carry-over of tdo-value.
  if (life == true) {
    document.forms[1].ear.focus();  // AI4U: Display blinking cursor.
  }
  len = 0;  // 2018-01-06: reset to prevent carry-over during reentry.
  tvb = 0;  // 2018-11-14: reset to prevent false tkb-values on verbs.
}  // 2018-01-06: Sensorium() module returns to MainLoop.

module.exports = Sensorium;
