class Phrase

  def initialize(text)
    @analysis = {}
    analyze(text)
  end

  def word_count
    @analysis
  end

  private

  def analyze(text)
    text.downcase.scan(/[a-z0-9']+/).each do |word|
      @analysis[word] = 0 unless @analysis.has_key? word
      @analysis[word] += 1
    end
  end

end
