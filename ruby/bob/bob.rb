class Bob
  def hey(stimulus)
    Responder.new(stimulus).response
  end
end

class Responder

  def initialize(stimulus)
    @stimulus = stimulus.strip
  end

  def response
    if is_empty?
      'Fine. Be that way!'
    elsif is_loud?
      'Woah, chill out!'
    elsif is_a_question?
      'Sure.'
    else
      'Whatever.'
    end
  end

  private

  def is_empty?
    @stimulus.length == 0
  end

  def is_loud?
    @stimulus.upcase == @stimulus && @stimulus.swapcase != @stimulus
  end

  def is_a_question?
    @stimulus.end_with? '?'
  end

end
