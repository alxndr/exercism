/*
(The MIT License)

Copyright (c) 2012 SHIN Suzuki <shinout310@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

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
  module.exports = SortedList;
}
