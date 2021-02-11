// Copyright (c)2021 Quinn Michaels

const data = require('./data.json');

function matchToUpper(match,p1,p2,p3) {
  if (!p2) return match;
  return `${p1}\#${p2.toUpperCase()}${p3}`;
}

module.exports = input => {
  const upper_join = data.upper.join('|');
  const upper_regex = new RegExp(`(^|\\s)(${upper_join})(\\W|$)`, 'gim');

  input = input.replace(upper_regex, matchToUpper)

    .replace(/(^|\s)(OK|CBR|AI)(\W|$)/g, '$1#$2$3')
    .replace(/(^|\s)(timephonehack)(\W|$)/gi, '$1#TimePhoneHack$3')
    .replace(/(^|\s)(gladyou\'re)(\W|$)/gi, '$1#glad you\'re$3')

    .replace(/\\#/g, '#');

  return input;
};
