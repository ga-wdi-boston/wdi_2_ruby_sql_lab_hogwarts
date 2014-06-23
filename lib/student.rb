class Student
  attr_reader :name, :gender, :birth_date, :house, :known_spells
  attr_accessor :admission_date, :year, :alumni_status

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

  def award_points_to(num)
    house.add_points(num)
  end

  def practice_spell(spell)
    if known_spells.key?(spell)
      @known_spells[spell] += 1 if @known_spells[spell] < 100
    else
      @known_spells[spell] = 0
    end
  end

  def summer
    @year += 1
    alumni_status = year > 7
    @known_spells.each do |k,v|
      @known_spells[k] -= 10
      if v-10 < 0
        @known_spells.delete(k)
      end
    end
  end

end

