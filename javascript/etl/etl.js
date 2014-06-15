if (module) {
  module.exports = transform;
}

function transform(old_schema) {
  return Object.keys(old_schema).reduce(transformer(old_schema), {});
}
function transformer(old_schema) {
  return function(new_schema, point_value) {
    var points = int(point_value);
    var keys = old_schema[points];
    function insert_points_into_schema(schema, word) {
      schema[word.toLowerCase()] = points;
      return schema;
    }
    return keys.reduce(insert_points_into_schema, new_schema);
  };
}

function int(a_string) {
  return parseInt(a_string, 10);
}
