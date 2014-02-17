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

  def to_roman
    convert_place_1000(self % 10000 / 1000) +
      convert_place_100(self % 1000 / 100) +
      convert_place_10(self % 100 / 10) +
      convert_place_1(self % 10 / 1)
  end

  %w(1 10 100 1000).each do |place|
    define_method("convert_place_#{place}") do |num|
      place = place.to_i
      case num
      when 0, 1, 2, 3
        roman_numerable_for(place) * num
      when 4
        roman_numerable_for(place) + roman_numerable_for(place * 5)
      when 5, 6, 7, 8
        roman_numerable_for(place * 5) + (roman_numerable_for(place) * (num - 5))
      when 9
        roman_numerable_for(place) + roman_numerable_for(place * 10)
      else
        raise
      end
    end
  end

  def roman_numerable_for(int)
    ROMAN_NUMERABLE_MAPPING[int]
  end

end

class Integer
  include RomanNumerable
end

