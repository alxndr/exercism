function transform(old_schema) {
  var new_schema = {};

  function add_value_to_new_key(schema, new_val) {
    return function add_something(old_value) {
      schema[old_value.toLowerCase()] = parseInt(new_val, 10);
    };
  }
  Object.keys(old_schema).forEach(function(old_key) {
    old_schema[old_key].forEach(add_value_to_new_key(new_schema, old_key));
  });

  return new_schema;
}

if (module) {
  module.exports = transform;
}
