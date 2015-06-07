module HelloWorld
  def self.hello(name)
    if name == ""
      name = "world"
    end
    "Hello, #{name}!"
  end
end
