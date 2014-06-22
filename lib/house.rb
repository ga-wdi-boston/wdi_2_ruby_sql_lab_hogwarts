require_relative '../lib/student'
class House

  @@house_list = []

  def self.house_list
    @@house_list
  end

  attr_accessor :name, :animal, :point, :students

  def initialize(name:,animal:,point:)
    @name = name
    @animal = animal
    @point = point
    @students = []

    @@house_list << self
  end


end
