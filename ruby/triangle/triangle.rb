class Triangle

  attr_reader :kind

  def initialize(a, b, c)
    raise TriangleError if a <= 0 || b <= 0 || c <= 0
    raise TriangleError if a + b <= c || b + c <= a || c + a <= b
    @kind = determine_triangle_type(a, b, c)
  end

  private

  def determine_triangle_type(a, b, c)
    return :equilateral if a === b && b === c
    return :isosceles   if a === b || b === c || c === a
    :scalene
  end

end

class TriangleError < StandardError; end
