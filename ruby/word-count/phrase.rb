class Phrase

  def initialize(text)
    @analysis = Hash.new(0)
    analyze text
  end

  def word_count
    @analysis
  end

  private

  def analyze(text)
    words_in(text).each do |word|
      @analysis[word] += 1
    end
  end

  def words_in(text)
    text.downcase.scan(/[[:word:]']+/)
  end

end
