class Robot

  attr_accessor :name

  STARTING_NAME = "AA000"

  def initialize
    generate_new_robot_name
  end

  def reset
    generate_new_robot_name
  end

  private

  def generate_new_robot_name
    self.name = @@last_robot_name = last_robot_name.succ
  end

  def last_robot_name
    @@last_robot_name ||= STARTING_NAME
  end

end
