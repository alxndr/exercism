function School() {

  var roster = {};

  function getRoster() {
    return roster;
  }

  function getGrade(grade) {
    if (roster.hasOwnProperty(grade)) {
      return roster[grade];
    }
    return [];
  }

  function addToRoster(name, grade) {
    if (roster.hasOwnProperty(grade)) {
      roster[grade].push(name);
      // could use smarter insertion to avoid sorting...
      // https://github.com/alxndr/exercism/blob/js_grade-school_sorted-list/javascript/grade-school/grade-school.js
      roster[grade] = roster[grade].sort();
    } else {
      roster[grade] = [name];
    }
  }

  return {
    add : addToRoster,
    roster : getRoster,
    grade : getGrade
  };
}

if (module) {
  module.exports = School;
}
