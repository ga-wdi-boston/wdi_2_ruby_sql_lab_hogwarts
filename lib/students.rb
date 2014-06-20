class Student
  attr_reader :name, :birth_date, :admission_date, :house
  attr_accessor :gender, :year, :alumni_status

  def initialize(name:, gender:, year: 'First Year', birth_date:, admission_date:, alumni_status: false, house:)
    @name, @gender, @year, @birth_date, @admission_date, @alumni_status, @house = name, gender, year, birth_date, admission_date, alumni_status, house

    @known_spells = []
  end

  def learn_spell(spells)
    @known_spells << spells
  end
end
