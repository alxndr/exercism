function Gigasecond(startDate) {
  var gigaSeconds = 1e12;
  var gigaDate = new Date(new Date(Number(startDate) + gigaSeconds).toDateString());

  this.date = function returnGigaDate() {
    return gigaDate;
  };
}

if (module) {
  module.exports = Gigasecond;
}
