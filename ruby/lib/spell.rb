class Spell
  attr_reader :name, :incantation, :level, :students

  def initialize(name:, incantation:, category:, level:)
    @name, @incantation, @category, @level = name, incantation, category, level
    @students = []
  end
end
