var rnaComplementMapping = { C: 'G', G: 'C', A: 'U', T: 'A' };

function rnaComplement(dnaNucleotide) {
  return rnaComplementMapping[dnaNucleotide];
}

function convertDnaNucleotidesToRna(dnaNucleotides) {
  return dnaNucleotides.replace(/./g, rnaComplement);
}

if (module) {
  module.exports = convertDnaNucleotidesToRna;
}
