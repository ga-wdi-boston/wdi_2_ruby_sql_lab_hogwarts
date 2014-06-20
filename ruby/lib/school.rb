class School
  attr_reader :name

  def initialize(name:)
    @name = name
    @houses = []
    @spells = []
  end
end
