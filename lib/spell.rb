require_relative '../lib/student'
require_relative '../lib/house'

class Spell

  @@spell_list = []

  def self.spell_list
    @@spell_list
  end

  attr_accessor :name,:incantation,:category,:level,:students

  def initialize(name:, incantation:, category:, level:)
    @name = name
    @incantation = incantation
    @category = category
    @level = level
    @students = []
    @@spell_list << self
  end

  def self.spell_dont_know(name)
    spell_name_list = @@spell_list.map{|i| i.name}
    spell_name_student = Student.student_spell_list(name).map{|k,v| k.name}

    spell_name_list - spell_name_student
  end

  def self.student_list_with_high_spell(spell)
    spell_level = @@spell_list.detect{|i| i.name == spell}.level
    student_list = @@spell_list.map{|i| i.students if i.name == spell}.compact.flatten
    student_list.map{|i| i.name if i.year <= spell_level }
  end

  def self.high_spell_category#(category,house)
    Student.roster.map{|k,v| v.map{|k,v| v}}
    #spell_category = spell_list.detect{|i| i.category = category}
    #students = spell_cateegory.each{|i| i.students}


  end

end
