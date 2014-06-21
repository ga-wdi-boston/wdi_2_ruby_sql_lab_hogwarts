# WDI SWL/Ruby Lab
# Blair Caple
# June 20, 2014

class KnownSpell

  attr_reader :id, :spell, :student
  attr_accessor :proficiency, :last_used

  def initialize(spell:, student:)
    @spell, @student = spell, student
  end

  def hash
    spell.hash + student.hash
  end

  def ==(obj)
    return false if self.class != obj.class
    self.hash == obj.hash
  end

  def eql?(obj)
    return false if self.class != obj.class
    self.hash == obj.hash
  end
end
