var something = +'1e12';
function Gigasecond(start_date) {
  function gigasecond_date() {
    var in_the_future = new Date(+start_date + something);
    in_the_future = new Date(in_the_future.setHours(0));
    in_the_future = new Date(in_the_future.setMinutes(0));
    in_the_future = new Date(in_the_future.setSeconds(0));
    return in_the_future;
  }

  this.date = gigasecond_date;
}

if (module) {
  module.exports = Gigasecond;
}
