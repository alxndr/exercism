module RomanNumerable

  ROMAN_NUMERABLE_MAPPING = {
       1 => 'I',
       5 => 'V',
      10 => 'X',
      50 => 'L',
     100 => 'C',
     500 => 'D',
    1000 => 'M'
  }
  BASES = [1000, 100, 10, 1]

  def to_roman
    BASES.reduce('') do |in_roman, place|
      in_roman += send("convert_place_#{place}", (self % (place * 10)) / place)
    end
  end

  BASES.each do |place|
    define_method("convert_place_#{place}") do |x|
      case x
      when 0, 1, 2, 3
        place.roman_chr * x
      when 4
        place.roman_chr + (place * 5).roman_chr
      when 5, 6, 7, 8
        (place * 5).roman_chr + (place.roman_chr * (x - 5))
      when 9
        place.roman_chr + (place * 10).roman_chr
      else
        raise ArgumentError, 'argument is not an integer such that: 0 <= n <= 9'
      end
    end
  end

  def roman_chr
    ROMAN_NUMERABLE_MAPPING[self] or raise NoMethodError, "#roman_chr can only be called on: #{ROMAN_NUMERABLE_MAPPING.keys.join ', '}"
  end

end

class Integer
  include RomanNumerable
end
