class School
  attr_reader :name
  attr_accessor :name, :houses, :spells

  def initialize(name:)
    @name = name
    @houses = []
    @spells = []
  end
end
