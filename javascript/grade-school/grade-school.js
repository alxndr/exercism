function School() {
  var roster = {};
  function get_roster() {
    return roster;
  }
  function get_grade(grade) {
    if (roster.hasOwnProperty(grade)) {
      return roster[grade];
    }
    return [];
  }
  function add_to_roster(name, grade) {
    if (roster.hasOwnProperty(grade)) {
      roster[grade].push(name);
      roster[grade] = roster[grade].sort(); // TODO use smarter insertion to avoid need to sort
    } else {
      roster[grade] = [name];
    }
  }

  this.add = add_to_roster;
  this.roster = get_roster;
  this.grade = get_grade;
}

if (module) {
  module.exports = School;
}
