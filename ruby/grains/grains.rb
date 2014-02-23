class Grains

  NUM_SQUARES = 64

  def square(i)
    2 ** (i - 1)
  end

  def total
    (1..NUM_SQUARES).inject(0) { |sum, i| sum + square(i) }
  end

end
