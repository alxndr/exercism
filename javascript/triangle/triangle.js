function Triangle(a, b, c) {
  function determine_kind() {
    if (a === undefined || b === undefined || c === undefined || a === 0 || b === 0 || c === 0) {
      throw new Error('that does not seem like a triangle');
    }
    if (a < 0 || b < 0 || c < 0 || a + b <= c || b + c <= a || c + a <= b) {
      return 'illegal';
    }
    if (a === b && b === c) {
      return 'equilateral';
    }
    if (a === b || b === c || c === a) {
      return 'isosceles';
    }
    return 'scalene';
  }

  this.kind = determine_kind;
}

if (module) {
  module.exports = Triangle;
}
