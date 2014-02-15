function DNA(sequence) {
  var dna_sequence = sequence.split('');

  function does_not_match_sequence(nucleotide, i) {
    return dna_sequence[i] != nucleotide;
  }
  function hamming_distance(other_sequence) {
    if (other_sequence.length > dna_sequence.length) {
      other_sequence = other_sequence.substr(0, dna_sequence.length);
    }
    return other_sequence.split('').filter(does_not_match_sequence).length;
  }

  // public interface
  this.hammingDistance = hamming_distance;
}

if (module) {
  module.exports = DNA;
}
