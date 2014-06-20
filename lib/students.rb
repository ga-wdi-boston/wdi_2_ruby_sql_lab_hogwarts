class Student
  attr_reader :name, :birth_date, :admission_date
  attr_accessor :gender, :year, :alumni_status

  def initialize(name:, gender:, year:, birth_date:, admission_date:, alumni_status:)
    @name, @gender, @year, @birth_date, @admission_date, @alumni_status = name, gender, year, birth_date, admission_date, alumni_status

    @known_spells = []
  end
end
