class Anagram

  def initialize(word)
    @original_word = word.downcase
    @letters = alphabetize_letters(@original_word)
  end

  def match(potential_matches)
    potential_matches.reduce([]) do |results, potential_match|
      if potential_match.downcase != @original_word \
        && alphabetize_letters(potential_match.downcase) == @letters
        results << potential_match
      end
      results
    end
  end

  private

  def alphabetize_letters(word)
    word.split('').sort.join
  end

end
