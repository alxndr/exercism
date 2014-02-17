function repeat(str, count) {
  // could be more efficient, but we won't hit count > 64
  return new Array(count+1).join(str);
}

function Grains() {
  function grains_on_square(num) {
    return parseInt('1' + repeat('0', num-1), 2);
  }

  function all_grains() {
    var all_squares = Array.apply(undefined,new Array(64)); // 64-long array
    return all_squares.reduce(function(sum, _, index) { return sum + grains_on_square(index+1); }, 0);
  }

  this.square = grains_on_square;
  this.total = all_grains;
}

if (module) {
  module.exports = Grains;
}
