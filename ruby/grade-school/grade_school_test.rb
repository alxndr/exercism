require 'minitest/autorun'
require_relative 'school'

class SchoolTest < MiniTest::Unit::TestCase

  def school
    @school
  end

  def setup
    @school = School.new
  end

  #def test_an_empty_school
    #assert_equal({}, school.to_hash)
  #end

  #def test_add_student
    #school.add("Aimee", 2)
    #assert_equal({2 => ["Aimee"]}, school.to_hash)
  #end

  #def test_add_more_students_in_same_class
    #school.add("Blair", 2)
    #school.add("James", 2)
    #school.add("Paul", 2)
    #assert_equal({2 => ["Blair", "James", "Paul"]}, school.to_hash)
  #end

  #def test_add_students_to_different_grades
    #school.add("Chelsea", 3)
    #school.add("Logan", 7)
    #assert_equal({3 => ["Chelsea"], 7 => ["Logan"]}, school.to_hash)
  #end

  #def test_get_students_in_a_grade
    #school.add("Bradley", 5)
    #school.add("Franklin", 5)
    #school.add("Jeff", 1)
    #assert_equal ["Bradley", "Franklin"], school.grade(5)
  #end

  #def test_get_students_sorted_in_a_grade
    #school.add("Franklin", 5)
    #school.add("Bradley", 5)
    #school.add("Jeff", 1)
    #assert_equal ["Bradley", "Franklin"], school.grade(5)
  #end

  #def test_get_students_in_a_non_existant_grade
    #assert_equal [], school.grade(1)
  #end

  #def test_sort_school
    #school.add("Jennifer", 4)
    #school.add("Kareem", 6)
    #school.add("Christopher", 4)
    #school.add("Kyle", 3)
    #sorted = {
      #3 => ["Kyle"],
      #4 => ["Christopher", "Jennifer"],
      #6 => ["Kareem"]
    #}
    #assert_equal sorted, school.to_hash
    #assert_equal [3, 4, 6], school.to_hash.keys
  #end

  def test_cant_modify_school_via_to_hash
    school.add "Bart", 4
    school.add "Lisa", 2

    begin
      school.to_hash[4].push "Lisa"
    rescue RuntimeError, NoMethodError
    end

    assert_equal ["Bart"], school.grade(4)
  end

  #def test_cant_modify_school_via_grade
    #school.add "Lisa", 2
    #school.add "Bart", 4

    #begin
      #school.grade(2).push "Maggie"
    #rescue RuntimeError, NoMethodError
    #end

    #assert_equal ["Lisa"], school.grade(2)
  #end

end
