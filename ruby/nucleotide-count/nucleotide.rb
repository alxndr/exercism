class Nucleotide

  def initialize(sequence)
    sequence_census = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
    @census = sequence.split('').each_with_object(sequence_census) { |letter, census|
      raise ArgumentError unless census.has_key? letter
      census[letter] += 1
    }
  end

  def count(nucleotide)
    @census[nucleotide] or raise ArgumentError
  end

  def nucleotide_counts
    @census
  end

  def self.from_dna(dna_string)
    self.new dna_string
  end

end
