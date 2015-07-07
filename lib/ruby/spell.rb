# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

# Represents a spell.
class Spell

  attr_accessor :name, :category, :level, :incantation

  # Creates a spell with the given name, catgeory, incantation and level
  # when taught.
  def initialize(name:, category:, level:, incantation:)
    @name, @category, @level, @incantation = name, category, level, incantation
  end
end
