class DNA

  VALID_NUCLEOTIDES = %w(A T C G)

  def initialize(sequence)
    @census = sequence.split('').each_with_object(Hash[ VALID_NUCLEOTIDES.zip([0] * VALID_NUCLEOTIDES.length) ]) do |letter, census|
      raise ArgumentError unless VALID_NUCLEOTIDES.include? letter
      census[letter] += 1
    end
  end

  def count(nucleotide)
    raise ArgumentError unless VALID_NUCLEOTIDES.include? nucleotide
    @census[nucleotide]
  end

  def nucleotide_counts
    @census
  end

end
