class Reaction
  def initialize(test_method_name, resp)
    @test_method_name = test_method_name
    @response = resp
  end

  def test(input)
    input.send(@test_method_name)
  end

  def response
    @response
  end
end

class Bob
  REACTIONS = [
    Reaction.new(:is_empty?,      'Fine. Be that way!'),
    Reaction.new(:is_loud?,       'Woah, chill out!'),
    Reaction.new(:is_a_question?, 'Sure.'),
    Reaction.new(:to_s,           'Whatever.'),
  ]

  def hey(input)
    stimulus = Stimulus.new input
    REACTIONS.each do |possible_reaction|
      return possible_reaction.response if possible_reaction.test(stimulus)
    end
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

