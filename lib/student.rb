class Student
  attr_reader :name, :gender, :year, :birth_date, :admission_date, :alumni_status, :house, :known_spells

  def initialize(
    name,
    gender,
    year,
    birth_date,
    admission_date,
    alumni_status,
    house)

    @name, @gender, @year, @birth_date, @admission_date, @alumni_status, @house =
      name, gender, year, Date.parse(birth_date), Date.parse(admission_date), alumni_status, house

    @known_spells = {}
  end

  def add_spell(spell, proficiency)
    @known_spells[spell] = proficiency
  end

end

