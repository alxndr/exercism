function School() { var roster = {};

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


// stripped down version of shinout/SortedList
// https://github.com/shinout/SortedList/blob/master/SortedList.js

/**
* SortedList : constructor
*/
var SortedList = function SortedList() { };

SortedList.prototype = [];
SortedList.prototype.constructor = Array.prototype.constructor;

/**
* sorted.insertOne(val)
* insert one value
* returns false if failed, inserted position if succeed
**/
SortedList.prototype.insertOne = function(val) {
  var pos = this.bsearch(val);
  this.splice(pos + 1, 0, val);
  return pos + 1;
};

/**
* sorted.bsearch(val)
* @returns position of the value
**/
SortedList.prototype.bsearch = function(val) {
  if (!this.length)
    return -1;
  var mpos,
    spos = 0,
    epos = this.length;
  while (epos - spos > 1) {
    mpos = Math.floor((spos + epos)/2);
    mval = this[mpos];
    var comp = this._compare(val, mval);
    if (comp === 0)
      return mpos;
    if (comp > 0)
      spos = mpos;
    else
      epos = mpos;
  }
  return (spos === 0 && this._compare(this[0], val) > 0) ? -1 : spos;
};

/**
* sorted.toArray()
* get raw array
**/
SortedList.prototype.toArray = function() {
  return this.slice();
};

/**
* default filtration function
**/
SortedList.prototype._filter = function(val, pos) {
  return true;
};

/**
* sorted.compare(a, b)
* default comparison function
**/
SortedList.prototype._compare = function(a, b) {
  return (a > b) ? 1 : (a === b)  ? 0 : -1;
};

if (module) {
  module.exports = School;
}
