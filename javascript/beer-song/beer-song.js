function bottles_phrase(count) {
  if (!count) {
    count = 'no more';
  }
  return count + ' ' + pluralize(count, 'bottle') + ' of beer';
}

function take_action(count) {
  var results = {};
  if (count) {
    results.phrase = 'Take ' + (count == 1 ? 'it' : 'one') + ' down and pass it around';
    results.new_count = count - 1;
  } else {
    results.phrase = 'Go to the store and buy some more';
    results.new_count = 99;
  }
  return results;
}

function capitalize(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

function pluralize(count, noun) {
  return noun + (count == 1 ? '' : 's');
}


var song = {

  verse : function verse(count) {
    var action;
    if (count < 0) {
      throw new Error("can't have fewer than 0 bottles!'");
    }
    action = take_action(count);
    return capitalize(bottles_phrase(count)) + ' on the wall, ' +
      bottles_phrase(count) + '.\n' +
      action.phrase + ', ' +
      bottles_phrase(action.new_count) + ' on the wall.\n';
  },

  sing : function sing(start, end) {
    var output;
    if (end === undefined) {
      return this.sing(start, 0);
    }
    if (start < end) {
      throw new Error("that's dangerous thinking there");
    }
    output = [];
    for (var i = start; i >= end; i--) {
      output.push(this.verse(i));
    }
    return output.join('\n');
  }

};

if (module) {
  module.exports = song;
}
