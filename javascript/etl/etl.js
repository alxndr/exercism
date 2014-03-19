if (module) {
  module.exports = transform;
}

function transform(old_schema) {
  return Object.keys(old_schema).reduce(transformer(old_schema), {});
}

function transformer(old_schema) {
  return function(new_schema_accumulator, point_value) {
    return old_schema[point_value].reduce(function(new_schema, word){
      new_schema[word.toLowerCase()] = int(point_value);
      return new_schema;
    }, new_schema_accumulator);
  };
}

function int(a_string) {
  return parseInt(a_string, 10);
}
