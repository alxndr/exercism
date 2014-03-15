function remove_non_numerals(string) {
  return string.replace(/[^0-9]/g, '');
}

function is_ten_long(clean_number) {
  return (clean_number.length == 10);
}

function has_extra_one(num) {
  return (num.length == 11 && num.substr(0, 2) === '11');
}

function trim_first_char(str) {
  return str.slice(1);
}

function clean(a_number) {
  var cleaned = remove_non_numerals(a_number);
  if (has_extra_one(cleaned)) {
    cleaned = trim_first_char(cleaned);
  }
  return cleaned;
}

function first_three_digits(num) {
  return num.substr(0, 3);
}

function make_number_getter(num) {
  var number_for_consumption = is_ten_long(num) ? num : '0000000000';
  return function return_number() {
    return number_for_consumption;
  };
}

function make_area_code_getter(num) {
  var area_code = first_three_digits(num);
  return function return_area_code() {
    return area_code;
  };
}

function make_to_string_getter(num) {
  var string_for_num = '(' + first_three_digits(num) + ') ' + num.substr(3, 3) + '-' + num.substr(6, 4);
  return function return_to_string() {
    return string_for_num;
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
