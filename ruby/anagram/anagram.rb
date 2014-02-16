class Anagram

  def initialize(word)
    @original_word = word.downcase
  end

  def match(potential_matches)
    potential_matches.reduce([]) do |results, potential_match|
      results << potential_match if is_new_word?(potential_match) && matches_original_word?(potential_match)
      results
    end
  end

  private

  def alphabetize_letters(word)
    word.split('').sort.join
  end

  def is_new_word?(word)
    word.downcase != @original_word
  end

  def matches_original_word?(word)
    alphabetize_letters(word.downcase) == alphabetize_letters(@original_word)
  end

end
