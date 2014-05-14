function capitalize(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

function pluralize(count, noun) {
  return noun + (count == 1 ? '' : 's');
}

function zero_to_n_inclusive(end) {
  return Array.apply(null, Array(end + 1));
}

function decrementing_range(start, end) {
  function start_minus_index(_val, index) {
    return start - index;
  }
  if (start < end) {
    throw new Error("that's dangerous thinking there");
  }
  return zero_to_n_inclusive(start - end).map(start_minus_index);
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
    return capitalize(wall_phrase(count)) + ', ' +
      bottles_phrase(count) + '.\n' +
      action.phrase + ', ' +
      wall_phrase(action.new_count) + '.\n';
  }

  function sing(start_count, end_count) {
    if (end_count === undefined) {
      return sing(start_count, 0);
    }
    return decrementing_range(start_count, end_count).map(verse).join('\n');
  }

  return {
    verse: verse,
    sing: sing
  };
}

if (module) {
  module.exports = new BottlesOfBeerSinger();
}
