class Raindrops
  def self.convert(num)
    factors = FactorFinder.find_factors(num)

    output = ''
    output += 'Pling' if factors.include?(3) || num == 3
    output += 'Plang' if factors.include?(5) || num == 5
    output += 'Plong' if factors.include?(7) || num == 7

    if output.empty?
      num.to_s
    else
      output
    end
  end
end

class FactorFinder
  def self.find_factors(num)
    # returns factors excluding 1 and itself
    (2..(num/2)).select { |i| (num % i).zero? }
  end
end
