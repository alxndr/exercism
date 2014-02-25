class DNA

  VALID_NUCLEOTIDES = %w(A T C G)

  def initialize(sequence_str)
    @sequence = sequence_str.split('')
    raise ArgumentError unless @sequence.all? { |nucleotide| VALID_NUCLEOTIDES.include? nucleotide }
  end

  def count(nucleotide)
    raise ArgumentError unless VALID_NUCLEOTIDES.include? nucleotide
    @sequence.count nucleotide
  end

  def nucleotide_counts
    @sequence.reduce(Hash[ VALID_NUCLEOTIDES.zip([0] * VALID_NUCLEOTIDES.length) ]) { |hash, letter| hash.tap{ |h| h[letter] += 1 } }
  end

end
