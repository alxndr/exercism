class Phrase

  def initialize(text)
    @analysis = Hash.new(0)
    analyze(text)
  end

  def word_count
    @analysis
  end

  private

  def analyze(text)
    text.downcase.scan(/[a-z0-9']+/).each { |word| @analysis[word] += 1 }
  end

end
