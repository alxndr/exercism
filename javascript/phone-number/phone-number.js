function PhoneNumber(dirty) {
  var cleaned_number;
  function clean(string) {
    return string.replace(/[^0-9]/g,'');
  }
  function is_valid(number) {
    if (number.length < 10) {
      return false;
    }
    if (number.length > 11) {
      return false;
    }
    if (number.length == 11 && number.substr(0, 2) != '11') {
      return false;
    }
    return true;
  }
  function number() {
    if (!is_valid(cleaned_number)) {
      return '0000000000';
    }
    if (cleaned_number.length == 11 && cleaned_number.substr(0,2) == '11') {
      cleaned_number = cleaned_number.slice(1);
    }
    return cleaned_number;
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
  cleaned_number = clean(dirty);

  // public interface
  this.number = number;
  this.areaCode = area_code;
  this.toString = to_string;
}

if (module) {
  module.exports = PhoneNumber;
}
