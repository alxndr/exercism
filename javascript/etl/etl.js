function transform(old_schema) {
  return Object.keys(old_schema).reduce(function(new_schema,point_value){
    return old_schema[point_value].reduce(function(ns, word){
      ns[word.toLowerCase()] = parseInt(point_value, 10);
      return ns;
    }, new_schema);
  }, {});
}

if (module) {
  module.exports = transform;
}
