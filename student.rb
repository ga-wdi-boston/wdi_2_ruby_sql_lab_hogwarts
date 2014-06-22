require_relative 'spell'
class Student

  attr_reader :name, :gender, :year, :bday, :admit_date, :alum, :house, :known_spells
  attr_writer :year, :admit_date, :house

  def initialize(name:, gender:, year:, bday:, admit_date:, alum: false, house:)

    @name, @gender, @year, @bday, @admit_date, @alum, @house =
    name, gender, year, bday, admit_date, alum, house

    @known_spells = {}
  end

  def learn_spell(spell, proficiency)
    @known_spells[spell] = proficiency
  end

  def known_categories
    known_spells.map {|spell, proficiency| spell.category}.uniq
  end

  def avg_proficiency
    known_spells.map {|spell, proficiency| proficiency}.reduce(0, &:+) / known_spells.count
  end
end
