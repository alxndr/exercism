class School

  def initialize
    @roster = {}
  end

  def add(name, grade)
    @roster[grade] = SortedArray.new unless @roster.has_key? grade
    @roster[grade].push name
  end

  def grade(num)
    if @roster.has_key? num
      @roster[num]
    else
      []
    end
  end

  def to_hash
    Hash[@roster.sort]
  end

end

class SortedArray < Array
  def initialize
    super
  end

  def push(element)
    insert find_location_for(element), element
  end

  private

  def find_location_for(element)
    find_index { |existing_element| element < existing_element } || -1
  end
end
