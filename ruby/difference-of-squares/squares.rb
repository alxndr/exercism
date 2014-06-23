class Squares

  def initialize(n)
    @limit = n
  end

  def square_of_sums
    sums ** 2
  end

  def sum_of_squares
    squares.reduce(&:+)
  end

  def difference
    square_of_sums - sum_of_squares
  end

  private

  def sums
    range.reduce(&:+)
  end

  def squares
    range.map{|n| n**2 }
  end

  def range
    @range ||= 0.upto(@limit)
  end

end
