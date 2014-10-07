var dnaToRnaMapping = {
  C: 'G',
  G: 'C',
  A: 'U',
  T: 'A'
};
function dnaNucleotideToRna(dnaNucleotide) {
  return dnaToRnaMapping[dnaNucleotide];
}

function dnaNucleotidesToRna(dnaNucleotides) {
  return dnaNucleotides.replace(/./g, dnaNucleotideToRna);
}

if (module) {
  module.exports = dnaNucleotidesToRna;
}
