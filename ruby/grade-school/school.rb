class School

  def initialize
    @roster = {}
  end

  def add(name, grade)
    @roster[grade] = [] unless @roster.has_key? grade
    @roster[grade] << name
    @roster[grade].sort! # TODO use sorted list
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
