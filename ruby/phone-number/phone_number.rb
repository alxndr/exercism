class PhoneNumber

  def initialize(input)
    number = numbers_only(input)
    number = maybe_trim_leading_one(number)
    number = '0000000000' if number.length < 10 || number.length === 11
    @number = number
  end

  def number
    @number
  end

  private

  def numbers_only(input)
    input.gsub(/\D/, '')
  end

  def maybe_trim_leading_one(something)
    something.sub(/^1/,'') if something.length === 11
    something
  end

end
