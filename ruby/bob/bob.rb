#    Reaction.new(:is_empty?,      'Fine. Be that way!'),
#    Reaction.new(:is_loud?,       'Woah, chill out!'),
#    Reaction.new(:is_a_question?, 'Sure.'),
#    Reaction.new(:to_s,           'Whatever.'),

class Reaction
  def test(_stimulus)
    true
  end

  def response
    @response || 'Whatever.'
  end
end

class SilentReaction < Reaction
  def initialize
    @response = 'Fine. Be that way!'
    super
  end

  def test(stimulus)
    stimulus.is_empty?
  end
end

class YellingReaction < Reaction
  def initialize
    @response = 'Woah, chill out!'
    super
  end

  def test(stimulus)
    stimulus.is_loud?
  end
end

class QuestioningReaction < Reaction
  def initialize
    @response = 'Sure.'
  end

  def test(stimulus)
    stimulus.is_a_question? && !stimulus.is_loud?
  end
end

class Bob

  REACTIONS = [ SilentReaction, YellingReaction, QuestioningReaction, Reaction ];

  def respond_to(input)
    stimulus = Stimulus.new input
    REACTIONS.find { |reaction_class| reaction_class.new.test(stimulus) }.response
  end
  alias_method :hey, :respond_to

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

