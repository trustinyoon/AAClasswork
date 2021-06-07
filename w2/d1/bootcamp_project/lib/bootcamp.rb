class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity 
      @students << student 
      true
    else
      false
    end
  end

  def enrolled?(student)
    @students.any? { |person| person == student}
  end

  def student_to_teacher_ratio
    @students.length/@teachers.length
  end

  def add_grade(student, grade)
    if enrolled?(student)
      @grades[student] << grade
      true
    else
      false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    if @grades[student].length == 0 || !enrolled?(student)
      return nil
    end
    @grades[student].sum/num_grades(student)
  end
end

