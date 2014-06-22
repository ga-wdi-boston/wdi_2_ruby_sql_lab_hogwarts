class Student
  attr_reader :name, :gender, :birth_date, :house
  attr_accessor :alumni_status, :spells, :admission_date, :year

  def initialize(name:, gender:, year:0, birth_date:, admission_date:0, alumni_status: false, house:)
    @name, @gender, @year, @birth_date, @admission_date, @alumni_status, @house = name, gender, year, birth_date, admission_date, alumni_status, house
    @spells = []
  end
end
