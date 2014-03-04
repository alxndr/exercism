function DNA(input) {
  var valid_nucleotides = {A: 'adenosine', C: 'cytidine', G: 'guanosine', T: 'thymidine', U: 'uracil'}; // values don't matter, but now you learned something
  var nucleotide_counts = input.split('').reduce(function(counts, nucleotide) {
    counts[nucleotide]++;
    return counts;
  }, {A: 0, T: 0, C: 0, G: 0});

  function count_of_nucleotide(nucleotide) {
    if (!valid_nucleotides.hasOwnProperty(nucleotide)) {
      throw new Error('Invalid Nucleotide');
    }
    return nucleotide_counts[nucleotide] || 0;
  }

  this.count = count_of_nucleotide;
  this.nucleotideCounts = nucleotide_counts;
}

if (module) {
  module.exports = DNA;
}
