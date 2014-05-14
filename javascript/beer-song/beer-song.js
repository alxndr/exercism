function capitalize(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

function pluralize(count, noun) {
  return noun + (count == 1 ? '' : 's');
}

function BottlesOfBeerSinger() {
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

  function bottles_phrase(count) {
    if (!count) {
      count = 'no more';
    }
    return count + ' ' + pluralize(count, 'bottle') + ' of beer';
  }

  function verse(bottle_count) {
    var action;
    if (bottle_count < 0) {
      throw new Error("can't have fewer than 0 bottles!'");
    }
    action = take_action(bottle_count);
    return capitalize(bottles_phrase(bottle_count)) + ' on the wall, ' +
      bottles_phrase(bottle_count) + '.\n' +
      action.phrase + ', ' +
      bottles_phrase(action.new_count) + ' on the wall.\n';
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
