var robot_name_log = { };

function random_capital_letter() {
  return String.fromCharCode(Math.floor(Math.random() * 26) + 65);
}

function random_digit() {
  return Math.floor(Math.random() * 10);
}

function RobotNamer() {
  function generate_name() {
    var name;
    do {
      name = random_capital_letter() +
        random_capital_letter() +
        random_digit() +
        random_digit() +
        random_digit();
    } while (robot_name_log.hasOwnProperty(name));
    robot_name_log[name] = true;
    return name;
  }
  function reset_name() {
    this.name = generate_name();
  }
  var name = generate_name();

  // public
  this.name = name;
  this.reset = reset_name;
}

if (module) {
  module.exports = RobotNamer;
}
