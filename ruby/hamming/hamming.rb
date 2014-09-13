class Hamming

  def self.compute(first, second)
    first, second = first.chars, second.chars
    if first.length < second.length
      shorter, longer = first, second
    else
      shorter, longer = second, first
    end

    shorter.zip(longer).count { |pair| pair[0] != pair[1] }
  end

end
