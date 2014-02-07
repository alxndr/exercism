class Grains

  NUM_SQUARES = 64

  def square(i)
    binary_1e(i)
  end

  def total
    (1..NUM_SQUARES).inject(0) { |sum, i| sum + binary_1e(i) }
  end

  private

  def binary_1e(i)
    eval "0b1#{'0' * (i - 1)}"
  end

end
