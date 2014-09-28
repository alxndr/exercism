function countDifferences(reference) {
  return function(count, nucleotide, index) {
    if (nucleotide === reference[index]) {
      return count;
    }
    return count + 1;
  };
}

function compute(strand1, strand2) {
  var shorter, longer;

  if (strand1.length < strand2.length) {
    shorter = strand1;
    longer = strand2;
  } else {
    shorter = strand2;
    longer = strand1;
  }

  return shorter.split('').reduce(countDifferences(longer), 0);
}

if (module) {
  module.exports = {
    compute: compute
  };
}
