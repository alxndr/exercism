function PhoneNumber(dirty_number) {
  var cleaned_number;
  function clean(a_number) {
    var cleaned = remove_non_numerals(a_number);
    if (cleaned.length == 11 && cleaned.substr(0, 2) === '11') {
      cleaned = cleaned.slice(1);
    }
    return cleaned;
  }
  function remove_non_numerals(string) {
    return string.replace(/[^0-9]/g,'');
  }
  function is_valid(clean_number) {
    return (clean_number.length == 10);
  }
  function number() {
    return is_valid(cleaned_number) ? cleaned_number : '0000000000';
  }
  function area_code() {
    return cleaned_number.substr(0, 3);
  }
  function to_string() {
    return '(' + area_code() + ') ' +
      cleaned_number.substr(3, 3) +
      '-' +
      cleaned_number.substr(6, 4);
  }
  cleaned_number = clean(dirty_number);

  // public interface
  this.number = number;
  this.areaCode = area_code;
  this.toString = to_string;
}

if (module) {
  module.exports = PhoneNumber;
}
