class Reaction
  def self.test(_stimulus)
    true
  end

  def self.response
    'Whatever.'
  end
end

class SilentReaction < Reaction
  def self.test(stimulus)
    stimulus.is_empty?
  end

  def self.response
    'Fine. Be that way!'
  end
end

class YellingReaction < Reaction
  def self.test(stimulus)
    stimulus.is_loud?
  end

  def self.response
    'Woah, chill out!'
  end
end

class QuestioningReaction < Reaction
  def self.test(stimulus)
    stimulus.is_a_question? && !stimulus.is_loud?
  end

  def self.response
    'Sure.'
  end
end

class Bob

  def initialize(reactions=[ SilentReaction,
                             YellingReaction,
                             QuestioningReaction,
                             Reaction ])
    @reactions = reactions
  end

  def hey(input)
    respond_to(Stimulus.new input)
  end

  private

  def respond_to(stimulus)
    @reactions.find { |reaction| reaction.test(stimulus) }.response
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

