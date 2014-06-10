class Proverb

  def initialize(*args, **opts)
    @nouns = args
    opts ||= {}
    @proverb_lines = generate_lines(opts[:qualifier] || '')
  end

  def to_s
    @proverb_lines.join("\n")
  end

  private

  def generate_lines(qualifier='')
    qualifier += ' ' unless qualifier.empty?

    lines = @nouns[0...-1].map.with_index { |noun, index| make_phrase(noun, index) }
    lines.push "And all for the want of a #{qualifier}#{@nouns.first}."
  end

  def make_phrase(noun, index)
    next_noun = @nouns[index+1]
    "For want of a #{noun} the #{next_noun} was lost."
  end

end
