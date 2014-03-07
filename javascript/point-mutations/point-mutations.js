function DNA(sequence) {
  var dna_sequence = sequence.split('');

  function nucleotide_at(index) {
    return dna_sequence[index];
  }

  function does_not_match_sequence(other_nucleotide, index) {
    return nucleotide_at(index) != other_nucleotide;
  }

  function find_hamming_distance_to(other_sequence) {
    return other_sequence.
      split('').
      splice(0, dna_sequence.length).
      filter(does_not_match_sequence).
      length;
  }

  this.hammingDistance = find_hamming_distance_to;
}

if (module) {
  module.exports = DNA;
}
