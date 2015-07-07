class AboveStudentLevel < StandardError
end

class Student
  attr_reader :name, :gender, :birth_date, :house
  attr_accessor :alumni_status, :spells, :admission_date, :year

  def initialize(name:, gender:, year:0, birth_date:, admission_date:0, alumni_status: false, house:)
    @name, @gender, @year, @birth_date, @admission_date, @alumni_status, @house = name, gender, year, birth_date, admission_date, alumni_status, house
    @spells = {}
  end

  def practice_spell(spell)
    begin
      raise AboveStudentLevel if spell.level > year

      if spells.has_key?(spell)
        spells[spell] += 0.01 if spells[spell] < 1.0
      else
        spells[spell] = 0
      end

    rescue AboveStudentLevel
    end
  end
end
