module StringAlphabetizer
  refine String do
    def alphabetize
      each_char.sort.join
    end
  end
end

class Anagram

  def initialize(word)
    @original_word = AnagrammableWord.new word
  end

  def match(words_to_check)
    @original_word.find_anagrams(words_to_check)
  end

end

class AnagrammableWord

  using StringAlphabetizer

  def initialize(word)
    @reference_word = word.downcase
    @alphabetized_reference_word = @reference_word.alphabetize
  end

  def find_anagrams(words)
    words.select { |word| unique_anagram_of? word }
  end

  private

  def unique_anagram_of?(check_word)
    check_word = check_word.downcase
    unique_word?(check_word) && letters_match?(check_word)
  end

  def unique_word?(check_word)
    check_word != @reference_word
  end

  def letters_match?(check_word)
    check_word.alphabetize === @alphabetized_reference_word
  end

end
