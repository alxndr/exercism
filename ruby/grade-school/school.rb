class School

  def initialize
    @roster = Roster.new
  end

  def add(name, n)
    @roster.add name, n
    nil
  end

  def grade(n)
    @roster.find_grade n
  end

  def to_hash
    @roster.to_hash
  end

end

class Roster

  def initialize
    @db = Hash.new
  end

  def add(name, n)
    find_or_create_grade(n).push(name).sort!
    nil
  end

  def find_grade(n)
    find_or_create_grade(n).freeze
  end

  def to_hash
    Hash[@db.sort].each_value{ |grade| grade.freeze }
  end

  private

  def find_or_create_grade(n)
    @db[n] ||= []
  end

end
