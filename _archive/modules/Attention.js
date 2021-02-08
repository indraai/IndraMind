function Attention() {
  brain = false;
  danger = false;
  freedom = false;
  if (skip < 1) {
    danger = true;
    TID=window.setTimeout("Security('Attention');",20000);
    skip = skip+1;
  }
}

module.exports = Attention;
