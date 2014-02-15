var dna_to_rna_mapping = {
  C: 'G',
  G: 'C',
  A: 'U',
  T: 'A'
};
function dna_nucleotide_to_rna(dna_nucleotide) {
  return dna_to_rna_mapping[dna_nucleotide];
}

function dna_nucleotides_to_rna(dna_nucleotides) {
  return dna_nucleotides.replace(/./g, dna_nucleotide_to_rna);
}

if (module) {
  module.exports = dna_nucleotides_to_rna;
}
