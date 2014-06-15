THINGS = [
  {factor: 3, output: 'Pling'},
  {factor: 5, output: 'Plang'},
  {factor: 7, output: 'Plong'},
]

class Raindrops
  def self.convert(num)
    factors = FactorFinder.find_factors(num)

    output = THINGS.reduce('') do |acc, thing|
      acc += thing[:output] if factors.include? thing[:factor]
      acc
    end

    if output.empty?
      num.to_s
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
