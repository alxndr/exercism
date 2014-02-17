class Proverb

  def initialize(*args, **opts)
    opts ||= {}
    @proverb_lines = generate_lines(args, opts[:qualifier])
  end

  def to_s
    @proverb_lines.join "\n"
  end

  private

  def generate_lines(nouns, qualifier)
    noun_pairs = nouns.zip(nouns[1..-1])[0..-2] # [[nail, shoe], [shoe, horse], ..., [battle, kingdom]
    puts noun_pairs.inspect
    qualifier = qualifier ? qualifier + ' ' : ''

    lines = noun_pairs.map { |first, second| "For want of a #{first} the #{second} was lost." }
    lines.push "And all for the want of a #{qualifier}#{nouns.first}."
  end

end
