# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

class Spell

  attr_accessor :name, :category, :level, :incantation, :school

  def initialize(name:, category:, level:, incantation:)
    @name, @category, @level, @incantation = name, category, level, incantation
  end
end
