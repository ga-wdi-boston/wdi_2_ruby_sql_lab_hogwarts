# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require 'date'
require 'set'
require_relative 'house'
require_relative 'known_spell'

# Represents a student
class Student

  attr_reader :id
  attr_accessor :name, :gender, :year, :birth_date, :house, :admission_date,
    :status

  # Creates a new student with the given information
  def initialize(name:, gender:, year: year, birth_date: nil,
    admission_date: nil, status: false)

    @name, @gender, @year, @house, @admission_date, @status =
      name, gender, year, house, admission_date, status
    @birth_date = birth_date.nil? ? nil : Date.parse(birth_date)
    @year = year.nil? ? 0 : year
    @known_spells = Set.new
  end

  def alumni_status?
    @alumni_status
  end

  # Returns a list of known spells for this student. Modifications to this list
  # will not affect the set of known spells.
  def known_spells
    result = []
    @known_spells.each { |e| result << e }
    result
  end

  # Returns the student's proficiency in the given spell, or false if the
  # student doesn't know the spell.
  def knows_spell?(spell)
    known_spells.each { |e| return e.proficiency if e.spell == spell }
    false
  end

  # Returns a list of all known spell categories
  def known_spell_categories
    result = Set.new
    known_spells.each { |e| result.add(e.spell.category) }
    result.to_a.sort!
  end

  # Adds the specified spell to the set of known spells for this student.
  # Returns true if the set of known spells did not contain the given spell,
  # false otherwise. The method will return false if the student is too
  # young to learn the given spell.
  # This method will set the student's proficiency for the given spell to a
  # random number between 10 and 100. Only Muggles can get a score of 0.
  def learn_spell(spell)
    return false if year < spell.level

    known_spell = KnownSpell.new(spell: spell, student: self)
    known_spell.proficiency = 10 + Random.rand(90)
    success = @known_spells.add?(known_spell)
    return false if success.nil?
    true
  end

  # Adds the specified collection of spells to this student. Spells in the
  # given collection that the student already knows are ignored.
  def learn_spells(collection)
    collection.each { |e| learn_spell(e) }
  end

  # Returns the student's aveage proficiency across all their known spells.
  def avg_proficiency
    (@known_spells.map(&:proficiency).reduce(0, &:+) / @known_spells.size).round
  end

  def change_points(points)
    house.change_points(points) if !house.nil?
  end
end
