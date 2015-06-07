var HelloWorld = function() {};

HelloWorld.prototype.hello = function(input) {
  if (!input) {
    input = "world";
  }
  return "Hello, " + input + "!";
};

module.exports = HelloWorld;
