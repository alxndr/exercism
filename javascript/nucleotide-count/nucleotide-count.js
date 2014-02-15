function DNA(input) {
  var valid_nucleotides = {A: 'adenosine', C: 'cytidine', G: 'guanosine', T: 'thymidine', U: 'uracil'}; // values don't matter, but now you learned something
  var nucleotide_counts = {A: 0, T: 0, C: 0, G: 0};

  function count_nucleotides(nucleotide) {
    if (!valid_nucleotides.hasOwnProperty(nucleotide)) {
      throw new Error('Invalid Nucleotide');
    }
    return nucleotide_counts[nucleotide] || 0;
  }

  input.split('').forEach(function(nucleotide) {
    if (!nucleotide_counts.hasOwnProperty(nucleotide)) {
      throw new Error('what kind of monster are you');
    }
    nucleotide_counts[nucleotide]++;
  });

  // public interface

  this.count = count_nucleotides;
  this.nucleotideCounts = nucleotide_counts;
}

if (module) {
  module.exports = DNA;
}
