class Raindrops

  def self.convert(num)
    factors = Raindrops.find_factors(num)
    output = ''
    if factors.include?(3) || num == 3
      output += 'Pling'
    end
    if factors.include?(5) || num == 5
      output += 'Plang'
    end
    if factors.include?(7) || num == 7
      output += 'Plong'
    end
    if output.empty?
      num.to_s
    else
      output
    end
  end

  def self.find_factors(num)
    (2..(num/2)).select { |i| (num % i).zero? }
  end

end
