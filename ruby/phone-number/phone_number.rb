class PhoneNumber

  def initialize(input)
    number = letters_and_numbers(input)
    number = maybe_trim_leading_one(number)
    number = '0000000000' if still_invalid(number)
    @number = number
  end

  def number
    @number
  end

  def to_s
    "(#{area_code}) #{exchange_number}-#{local_number}"
  end

  def area_code
    @number[0,3]
  end

  def exchange_number
    @number[3,3]
  end

  def local_number
    @number[6,4]
  end

  private

  def letters_and_numbers(input)
    input.gsub(/[^a-z\d]/, '')
  end

  def maybe_trim_leading_one(num)
    if num.length === 11 || num.length === 12
      num.sub(/^1/,'')
    else
      num
    end
  end

  def still_invalid(num)
    num.length < 10 || num.length === 11 || num.match(/[a-z]/)
  end

end
