function make_filter(list) {
  return function does_not_match_list(element, i) {
    return list[i] != element;
  };
}

function DNA(sequence) {
  var dna_sequence = sequence.split('');

  function hamming_distance(other_sequence) {
    return other_sequence.split('').splice(0, dna_sequence.length).filter(make_filter(dna_sequence)).length;
  }

  this.hammingDistance = hamming_distance;
}

if (module) {
  module.exports = DNA;
}
