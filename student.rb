require_relative 'spell'
class Student

  attr_reader :name, :gender, :year, :bday, :admit_date, :alum, :house, :known_spells

  def initialize(name:, gender:, year:, bday:, admit_date:, alum: false, house:)

    @name, @gender, @year, @bday, @admit_date, @alum, @house =
    name, gender, year, bday, admit_date, alum, house

    @known_spells = {}
  end

  def learn_spell(spell, proficiency)
    @known_spells[spell] = proficiency
  end

end
