function Gigasecond(start_date) {
  var giga_date = new Date(new Date(Number(start_date) + 1e12).toDateString());

  this.date = function return_giga_date() {
    return giga_date;
  };
}

if (module) {
  module.exports = Gigasecond;
}
