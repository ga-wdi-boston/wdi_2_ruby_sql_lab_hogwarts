class House
  attr_reader :name, :animal
  attr_accessor :points

  def initialize(name:, animal:, points: 0)
    @name, @animal, @points = name, animal, points

    @students = []
  end

  def bulk_add_students(students)
    students.each do |student|
      @students << student
    end
  end

  def add_student(student)
    @students << student
  end

  # def update_student_list
  #   Student.where
  # end
end
