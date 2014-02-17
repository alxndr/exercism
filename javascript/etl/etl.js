function transform(old_schema) {
  var new_schema = {};
  Object.keys(old_schema).forEach(function(old_key) {
    old_schema[old_key].forEach(function(old_value) {
      new_schema[old_value.toLowerCase()] = parseInt(old_key, 10);
    });
  });
  return new_schema;
}

if (module) {
  module.exports = transform;
}
