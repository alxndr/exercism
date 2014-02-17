class Grains

  NUM_SQUARES = 64

  def square(i)
    "1#{'0' * (i - 1)}".to_i(2)
  end

  def total
    (1..NUM_SQUARES).inject(0) { |sum, i| sum + square(i) }
  end

end
