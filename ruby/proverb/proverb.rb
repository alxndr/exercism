class Proverb

  def initialize(*args, **opts)
    @nouns = args
    @opts = opts
    generate_lines
  end

  def to_s
    @proverb.join "\n"
  end

  private

  def generate_lines
    noun_pairs = @nouns.zip(@nouns[1..-1])[0..-2] # [[nail, shoe], [shoe, horse], ...]
    qualifier = @opts[:qualifier] ? @opts[:qualifier] + ' ' : ''

    @proverb = noun_pairs.map { |first, second| "For want of a #{first} the #{second} was lost." }
    @proverb.push "And all for the want of a #{qualifier}#{@nouns.first}."
  end

end
