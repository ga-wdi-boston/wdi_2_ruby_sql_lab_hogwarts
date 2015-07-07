require 'date'
class School


  def initialize(name:, houses:, spells:)
    @name, @houses, @spells = name, houses, spells
  end

  def current_students
    roster = []
    @houses.map {|house| house.undergrad_roster.map {|s| roster << s.name }}
    roster.sort
  end

  def full_roster
    roster = {}
    @houses.each {|house| roster[house.name] = house.full_roster }
    roster
  end

  def spells_to_learn(student)
    @spells.map {|spell| spell.name if student.year >= spell.level && !student.known_spells[spell] }.compact
  end

  def students_to_learn(spell)
    @houses.map { |house|
      house.students.map {|s| s.name if !s.known_spells[spell] && s.year >= spell.level}.compact
    }.flatten
  end

  def best_spell_category(house)
    categories = @spells.map {|sp| sp.category}.uniq
    ranks = {}
    categories.each {|cat| ranks[cat] = house.total_proficiency(cat)}
    ranks.key(ranks.values.max)
  end

  # Doesn't properly verify students age
  def admit_student(student, house)
    raise "You're too young" if false #(Date.today - Date.new(*student.bday.split('-').map{|e| e.to_i})).year < 10
    student.year = 1
    student.house = house.name
    student.admit_date = Time.now
    house.add_student(student)
  end

  def award_points(student, points)
    @houses.each { |house| house.add_points(points) if house.name == student.house}
  end

end
