require_relative 'student'
class House

  attr_reader :name, :students, :animal, :points

  def initialize(name:, animal:, points: 0)
    @name, @animal, @points = name, animal, points
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def undergrad_roster
    students.map {|student| student unless student.alum}.compact
  end

  def full_roster
    students_by_year = {}
    students.each {|s| students_by_year[s.year] ? students_by_year[s.year] << s.name : students_by_year[s.year] = [s.name] }
    students_by_year.values.sort!
    students_by_year
  end

  def total_proficiency(spell_category)
    total = 0
    students.each {|s| s.known_spells.each {|sp, prof| total += prof if sp.category == spell_category }}
    total
  end

  def add_points(points)
    @points += points
  end

end
