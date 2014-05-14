class PhoneNumber

  attr_reader :number

  def initialize(input)
    @number = maybe_trim_leading_one(remove_invalid_characters(input))
    @number = '0000000000' unless okay? @number
  end

  def to_s
    "(#{area_code}) #{exchange_number}-#{local_number}"
  end

  def area_code
    number[0,3]
  end

  def exchange_number
    number[3,3]
  end

  def local_number
    number[6,4]
  end

  private

  def remove_invalid_characters(input)
    input.gsub(/[^a-z\d]/, '')
  end

  def maybe_trim_leading_one(num)
    if num.length === 11 || num.length === 12
      num.sub(/^1/,'')
    else
      num
    end
  end

  def okay?(num)
    num.length === 10 && !num.match(/[a-z]/)
  end

end
