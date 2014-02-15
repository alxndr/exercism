function pluralize(count, noun) {
  return noun + (count == 1 ? '' : 's');
}

function bottles_phrase(count) {
  if (!count) {
    count = 'no more';
  }
  return count + ' ' + pluralize(count, 'bottle') + ' of beer';
}

function take_action(count) {
  var results = {};
  if (count) {
    if (count == 1) {
      results.action_phrase = 'Take it down and pass it around';
    } else {
      results.action_phrase = 'Take one down and pass it around';
    }
    results.new_count = count - 1;
  } else {
    results.action_phrase = 'Go to the store and buy some more';
    results.new_count = 99;
  }
  return results;
}

function capitalize(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}


var song = {

  verse : function verse(count) {
    if (count < 0) {
      throw new Error("can't have fewer than 0 bottles!'");
    }
    var output = [];
    var action = take_action(count);
    output.push(capitalize(bottles_phrase(count)) + ' on the wall, ');
    output.push(bottles_phrase(count) + '.\n');
    output.push(action.action_phrase + ', ' + bottles_phrase(action.new_count) + ' on the wall.\n');
    return output.join('');
  },

  sing : function sing(start, end) {
    if (end === undefined) {
      return this.sing(start, 0);
    }
    if (start < end) {
      throw new Error("that's dangerous thinking there");
    }
    var output = [];
    for (var i = start; i >= end; i--) {
      output.push(this.verse(i));
    }
    return output.join('\n');
  }

};

if (module) {
  module.exports = song;
}
