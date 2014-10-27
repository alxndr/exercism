class School

  def initialize
    @roster = Roster.new
  end

  def add(name, grade)
    @roster.add(name, grade)
  end

  def grade(n)
    @roster.find_grade(n).freeze
  end

  def to_hash
    @roster.to_hash.freeze
  end

end

class Roster

  def initialize
    @db = {}
  end

  def add(name, grade)
    find_grade(grade).push name
    find_grade(grade).sort! # keeps names sorted wthin grades
    @db[grade]
  end

  def find_grade(num)
    @db[num] ||= []
  end

  def to_hash
    # generates a new hash with grade numbers in order (as well as names sorted within grades)
    #@db.keys.sort.each_with_object({}) { |grade, hash|
      #hash[grade] = @db[grade]
    #}
    puts "CALLING TO HASH"
    Hash[@db.sort].freeze
  end

end
