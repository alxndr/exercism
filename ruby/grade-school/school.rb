class School

  def initialize
    @roster = Roster.new
  end

  def add(name, grade)
    @roster.add(name, grade)
  end

  def grade(n)
    @roster.find_grade(n)
  end

  def to_hash
    @roster.to_hash
  end

end

class Roster

  def initialize
    @roster = {}
  end

  def add(name, grade)
    find_grade(grade).push name
    @roster[grade].sort!
  end

  def find_grade(num)
    @roster[num] ||= []
  end

  def to_hash
    Hash[@roster]
  end

end
