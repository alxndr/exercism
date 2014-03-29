class Anagram

  def initialize(word)
    @original_word = AnagrammableWord.new word
  end

  def match(words_to_check)
    words_to_check.select { |word| @original_word.unique_anagram_of? word.downcase }
  end

end

class AnagrammableWord

  module StringAlphabetizer
    refine String do
      def alphabetize
        self.each_char.sort.join
      end
    end
  end
  using StringAlphabetizer

  def initialize(word)
    @reference = word.downcase
    @alphabetized_reference = @reference.alphabetize
  end

  def unique_anagram_of?(check_word)
    check_word != @reference && check_word.alphabetize === @alphabetized_reference
  end

end
