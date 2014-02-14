class Bob

  def hey(stimulus='')
    if is_empty?(stimulus)
      'Fine. Be that way!'
    elsif is_loud?(stimulus)
      'Woah, chill out!'
    elsif is_a_question?(stimulus)
      'Sure.'
    else
      'Whatever.'
    end
  end

  private

  def is_empty?(stimulus)
    stimulus.strip.length == 0
  end

  def is_loud?(stimulus)
    stimulus.match(/[a-z]/i) && stimulus.upcase == stimulus
  end

  def is_a_question?(stimulus)
    stimulus.end_with? '?'
  end

end
