class Grains

  NUM_SQUARES = 64

  def square(i)
    2 ** (i - 1)
  end

  def total
    square(NUM_SQUARES + 1) - 1
  end

end
