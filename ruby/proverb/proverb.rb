class Proverb

  def initialize(*args, **opts)
    @nouns = args
    @opts = {qualifier: ''}.merge opts
  end

  def to_s
    proverb = []
    @nouns[0...-1].each_with_index do |noun, i|
      proverb.push "For want of a #{noun} the #{@nouns[i+1]} was lost."
    end
    qualifier = @opts[:qualifier].length == 0 ? '' : @opts[:qualifier] + ' '
    proverb.push "And all for the want of a #{qualifier}#{@nouns.first}."
    proverb.join "\n"
  end

end
