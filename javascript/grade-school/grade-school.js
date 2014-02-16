function School() {
  var roster = {};
  var SortedList = require('./sorted-list.js');

  function get_roster() {
    var grades = Object.keys(roster);
    var roster_converted = {};
    grades.forEach(function(grade) {
      roster_converted[grade] = roster[grade].toArray();
    });
    return roster_converted;
  }

  function get_grade(grade) {
    if (roster.hasOwnProperty(grade)) {
      return roster[grade].toArray();
    }
    return [];
  }

  function add_to_roster(name, grade) {
    if (!roster.hasOwnProperty(grade)) {
      roster[grade] = new SortedList();
    }
    roster[grade].insertOne(name);
  }

  this.add = add_to_roster;
  this.roster = get_roster;
  this.grade = get_grade;
}

if (module) {
  module.exports = School;
}
