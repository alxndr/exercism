FACTOR_MAPPINGS = [
  {factor: 3, output: 'Pling'},
  {factor: 5, output: 'Plang'},
  {factor: 7, output: 'Plong'},
]

class Raindrops
  def self.convert(num)
    factors = FactorFinder.find_factors(num)

    output = FACTOR_MAPPINGS.reduce('') { |memo, mapping| self.potentially_add_to_output memo, mapping, factors }

    if output.empty?
      num.to_s
    else
      output
    end
  end

  def self.potentially_add_to_output(output, mapping, factors)
    if factors.include? mapping[:factor]
      output += mapping[:output]
    else
      output
    end
  end

end

class FactorFinder
  def self.find_factors(num)
    [1, num] | (2..(num/2)).select { |i| (num % i).zero? }
  end
end
