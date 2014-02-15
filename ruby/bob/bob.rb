class Bob
  def hey(stimulus)
    Responder.new(Stimulus.new stimulus).response
  end
end

class Stimulus
  def initialize(stimulus)
    @stimulus = stimulus.strip
  end

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

class Responder
  def initialize(input)
    @input = input
  end

  def response
    if @input.is_empty?
      'Fine. Be that way!'
    elsif @input.is_loud?
      'Woah, chill out!'
    elsif @input.is_a_question?
      'Sure.'
    else
      'Whatever.'
    end
  end
end
