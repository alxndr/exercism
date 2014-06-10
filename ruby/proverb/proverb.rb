class Proverb

  def initialize(*args, **opts)
    opts ||= {}
    @proverb_lines = generate_lines(args, opts[:qualifier] || '')
  end

  def to_s
    @proverb_lines.join("\n")
  end

  private

  def generate_lines(nouns, qualifier='')
    qualifier += ' ' unless qualifier.empty?
    noun_pairs = list_to_pairs(nouns)

    lines = noun_pairs.map { |want, thing| "For want of a #{want} the #{thing} was lost." }
    lines.push "And all for the want of a #{qualifier}#{nouns.first}."
  end

  def list_to_pairs(list)
    list.zip(list[1..-1])[0..-2]
  end

end
