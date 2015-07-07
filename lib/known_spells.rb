class KnownSpell
  attr_reader :level, :spell, :student
  attr_reader :proficiency

  def initialize(proficiency:, level:, spell:, student:)
    @proficiency, @level, @spell, @student = proficiency, level, spell, student

    self.student.learn_spell(spell)
  end
end
