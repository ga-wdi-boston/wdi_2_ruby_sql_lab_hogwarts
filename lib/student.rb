require_relative '../lib/house'

class Student
  attr_accessor :name,:gender,:year,:birth_date,:admission_date,:alum_st,:known_spells,:house

  @@student_list = []

  def self.student_list
    @@student_list
  end

  def initialize(name:, gender:,
    house:,year:, birth_date:,
    admission_date:, alum_st:)
    @name = name
    @gender = gender
    @year = year
    @birth_date = birth_date
    @admission_date = admission_date
    @alum_st = alum_st
    @known_spells
    @house = house

    @@student_list << self
  end

  def self.sort_student_list
    @@student_list.map{|i| i.name}.sort
  end

  def self.student_spell_list(name)
    @@student_list.detect{|i| i.name == name}.known_spells
  end

  def self.known_spell_categories(name)
    self.student_spell_list(name).map{|k,v| k.category}
  end

  def self.average_proficiency(name)
    spells = self.student_spell_list(name).map{|k,v| v}
    spells.reduce(0,:+) / spells.length
  end

  def self.roster
    roster = {}
    house_names = House.house_list.map{|i| i.name}

    house1 = self.student_list.map{|x| x if x.house == house_names[0]}.compact
    house2 = self.student_list.map{|x| x if x.house == house_names[1]}.compact
    house3 = self.student_list.map{|x| x if x.house == house_names[2]}.compact
    house4 = self.student_list.map{|x| x if x.house == house_names[3]}.compact

    h1 = {}
    h1[1] = []
    h1[2] = []
    h1[3] = []
    h1[4] = []

    h2 = {}
    h2[1] = []
    h2[2] = []
    h2[3] = []
    h2[4] = []

    h3 = {}
    h3[1] = []
    h3[2] = []
    h3[3] = []
    h3[4] = []

    h4 = {}
    h4[1] = []
    h4[2] = []
    h4[3] = []
    h4[4] = []

    house1.each{|i| h1[1] << i.name if i.year == 1}
    house1.each{|i| h1[2] << i.name if i.year == 2}
    house1.each{|i| h1[3] << i.name if i.year == 3}
    house1.each{|i| h1[4] << i.name if i.year == 4}

    house2.each{|i| h2[1] << i.name if i.year == 1}
    house2.each{|i| h2[2] << i.name if i.year == 2}
    house2.each{|i| h2[3] << i.name if i.year == 3}
    house2.each{|i| h2[4] << i.name if i.year == 4}

    house3.each{|i| h3[1] << i.name if i.year == 1}
    house3.each{|i| h3[2] << i.name if i.year == 2}
    house3.each{|i| h3[3] << i.name if i.year == 3}
    house3.each{|i| h3[4] << i.name if i.year == 4}

    house4.each{|i| h4[1] << i.name if i.year == 1}
    house4.each{|i| h4[2] << i.name if i.year == 2}
    house4.each{|i| h4[3] << i.name if i.year == 3}
    house4.each{|i| h4[4] << i.name if i.year == 4}

    roster[house_names[0]] = h1
    roster[house_names[1]] = h2
    roster[house_names[2]] = h3
    roster[house_names[3]] = h4

    roster
  end

end
