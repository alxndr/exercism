function Triangle(a, b, c) {
  var is_missing_number = (a === undefined || b === undefined || c === undefined || a === 0 || b === 0 || c === 0);
  var is_impossible_triangle = (a < 0 || b < 0 || c < 0 || a + b <= c || b + c <= a || c + a <= b);
  var is_equilateral = (a === b && b === c);
  var is_isoceles = (a === b || b === c || c === a);
  var triangle_kind = determine_kind();

  function determine_kind() {
    switch (true) {
      case is_missing_number:
      case is_impossible_triangle:
        return 'illegal';
      case is_equilateral:
        return 'equilateral';
      case is_isoceles:
        return 'isosceles';
      default:
        return 'scalene';
    }
  }
  function return_triangle_kind() {
    if (is_missing_number) {
      throw new Error('that does not seem like a triangle');
    }
    return triangle_kind;
  }

  this.kind = return_triangle_kind;
}

if (module) {
  module.exports = Triangle;
}
