class DNA

  def initialize(sequence)
    @census = sequence.split('').each_with_object({
      'A' => 0,
      'T' => 0,
      'C' => 0,
      'G' => 0
    }) do |letter, census|
      raise ArgumentError unless census.has_key? letter
      census[letter] += 1
    end
  end

  def count(nucleotide)
    @census[nucleotide] or raise ArgumentError
  end

  def nucleotide_counts
    @census
  end

end
