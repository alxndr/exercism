class Array
  def keep(&block)
    self.keep_if { |elem| block.call(elem) }
  end

  def discard(&block)
    self.keep_if { |elem| !block.call(elem) }
  end
end
