class Hamming

  def self.compute(first, second)
    min_length = [first.length, second.length].min
    first = first.slice(0...min_length)
    second = second.slice(0...min_length)

    first_split, second_split = first.chars, second.chars

    first_split.zip(second_split).count { |pair| pair[0] != pair[1] }
  end

end
