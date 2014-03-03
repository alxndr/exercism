var giga = +'1e12';
function Gigasecond(start_date) {
  function gigasecond_date() {
    return new Date(new Date(+start_date + giga).toDateString());
  }

  this.date = gigasecond_date;
}

if (module) {
  module.exports = Gigasecond;
}
