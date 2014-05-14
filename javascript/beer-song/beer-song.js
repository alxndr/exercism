function capitalize(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

function pluralize(count, noun) {
  return noun + (count == 1 ? '' : 's');
}

function BottlesOfBeerSinger() {
  var RESET_ACTION = {
    phrase : 'Go to the store and buy some more',
    new_count : 99
  };

  function take_action(count) {
    if (!count) {
      return RESET_ACTION;
    }
    return {
      phrase : 'Take ' + (count == 1 ? 'it' : 'one') + ' down and pass it around',
      new_count : count - 1
    };
  }

  function bottles_phrase(count) {
    if (!count) {
      count = 'no more';
    }
    return count + ' ' + pluralize(count, 'bottle') + ' of beer';
  }

  function wall_phrase(count) {
    return bottles_phrase(count) + ' on the wall';
  }

  function verse(count) {
    var action;
    if (count < 0) {
      throw new Error("can't have fewer than 0 bottles!'");
    }
    action = take_action(count);
    return capitalize(wall_phrase(count)) + ', ' + bottles_phrase(count) + '.\n' +
      action.phrase + ', ' + wall_phrase(action.new_count) + '.\n';
  }

  function sing(start_count, end_count) {
    var output;
    if (end_count === undefined) {
      return sing(start_count, 0);
    }
    if (start_count < end_count) {
      throw new Error("that's dangerous thinking there");
    }
    output = [];
    for (var i = start_count; i >= end_count; i--) {
      output.push(verse(i));
    }
    return output.join('\n');
  }

  return {
    verse: verse,
    sing: sing
  };
}

if (module) {
  module.exports = new BottlesOfBeerSinger();
}
