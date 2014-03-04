function remove_non_numerals(string) {
  return string.replace(/[^0-9]/g,'');
}

function is_ten_long(clean_number) {
  return (clean_number.length == 10);
}

function has_extra_one(num) {
  return (num.length == 11 && num.substr(0, 2) === '11');
}

function clean(a_number) {
  var cleaned = remove_non_numerals(a_number);
  if (has_extra_one(cleaned)) {
    cleaned = cleaned.slice(1);
  }
  return cleaned;
}

function first_three_digits(num) {
  return num.substr(0, 3);
}

function make_number_getter(num) {
  var val = is_ten_long(num) ? num : '0000000000';
  return function number() {
    return val;
  };
}

function make_area_code_getter(num) {
  var val = first_three_digits(num);
  return function area_code() {
    return val;
  };
}

function make_to_string_getter(num) {
  var val = '(' + first_three_digits(num) + ') ' + num.substr(3, 3) + '-' + num.substr(6, 4);
  return function to_string() {
    return val;
  };
}

function PhoneNumber(dirty_number) {
  var cleaned_number = clean(dirty_number);

  this.number = make_number_getter(cleaned_number);
  this.areaCode = make_area_code_getter(cleaned_number);
  this.toString = make_to_string_getter(cleaned_number);
}

if (module) {
  module.exports = PhoneNumber;
}
