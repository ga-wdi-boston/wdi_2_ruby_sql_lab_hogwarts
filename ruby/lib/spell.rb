class Spell
  attr_reader :name, :incantation, :category, :level
  attr_accessor :students

  def initialize(name:, incantation:, category:, level:)
    @name, @incantation, @category, @level = name, incantation, category, level
    @students = []
  end
end
