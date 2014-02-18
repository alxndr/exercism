class PrimeFactors

  def self.for(num)
    case num
    when 0, 1
      []
    else
      a_factor = (2..num/2).find { |n| (num % n).zero? }
      if a_factor
        [a_factor, *self.for(num/a_factor)]
      else
        [num]
      end
    end
  end

end
