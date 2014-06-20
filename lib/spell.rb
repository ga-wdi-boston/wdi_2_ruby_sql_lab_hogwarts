class Spell
  attr_reader :name, :incantation, :category, :level
  def initialize(name, incantation, category, level)
    @name, @incantation, @category, @level = name, incantation, category, level
    @known_by = []
  end

end
