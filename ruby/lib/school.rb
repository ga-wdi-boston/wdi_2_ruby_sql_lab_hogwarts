class School
  attr_reader :name
  attr_accessor :name, :houses, :spells

  def initialize(name:)
    @name = name
    @houses = []
    @spells = []
  end

  def adjust_house_points(student, points)
    student.house.points += points
  end

  def spell_workshop(spell_category)
    spells_in_category = spells.select { |spell| spell.category == spell_category }
    current_students = houses.map(&:students).flatten.select { |student| student.alumni_status == false }

    spells_in_category.each do |spell|
      current_students.each do |student|
        10.times { student.practice_spell(spell) }
      end
    end
  end

  def has_most_points
    most_points = houses.map(&:points).max
    houses.select { |house| house.points = most_points }
  end

  def summer_break
    current_students = houses.map(&:students).flatten.select { |student| student.alumni_status == false }

    current_students.each do |student|
      student.alumni_status = true if student.year == 7
      student.year += 1

      student.spells.each do |spell, proficiency|
        if proficiency >= 0.1
          proficiency -= 0.1
        else
          student.spells.delete(spell)
        end
      end
    end
  end
end
