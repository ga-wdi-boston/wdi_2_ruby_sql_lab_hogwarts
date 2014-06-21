
class Spell

  attr_reader :name, :incantation, :category, :level, :students

  def initialize(name:, incantation:, category:, level: 1)
    @name, @incantation, @category, @level = name, incantation, category, level
    @students = []
  end

  def add_student(student)
    @students << student
  end

end
