class Phrase

  def initialize(text)
    @text = text
    @analysis = Hash.new(0)
    analyze
  end

  def word_count
    @analysis
  end

  private

  def analyze
    words.each do |word|
      @analysis[word] += 1
    end
  end

  def words
    @text.downcase.scan(/[[:word:]']+/)
  end

end
