function transformer(old_schema) {
  return function reducer(new_schema, points) {
    var words = old_schema[points];

    words.forEach(function value_into_new_schema(word) {
      new_schema[word.toLowerCase()] = parseInt(points, 10);
    });

    return new_schema;
  };
}

function transform(old_schema) {
  return Object.keys(old_schema).reduce(transformer(old_schema), {});
}

if (module) {
  module.exports = transform;
}
