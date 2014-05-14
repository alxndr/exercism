function Gigasecond(startDate) {
  var gigaDate = new Date(new Date(Number(startDate) + 1e12).toDateString());

  this.date = function returnGigaDate() {
    return gigaDate;
  };
}

if (module) {
  module.exports = Gigasecond;
}
