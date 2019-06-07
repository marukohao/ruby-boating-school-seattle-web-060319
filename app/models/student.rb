class Student
  attr_accessor :first_name
  @@all = []
  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def self.all
    @@all 
  end

  def add_boating_test(test_name, test_status, instructor)
    Boatingtest.new(self,test_name, test_status, instructor)
  end

  def self.find_student(first_name)
    @@all.find {|student| student.first_name == first_name}
  end
  
  def grade_percentage
    pass_count = 0
    fail_count = 0
    BoatingTest.all.each do |test|
      if test.student == self
        if test.test_status == "passed"
          pass_count += 1
        else
          fail_count += 1
        end
      end
    end
    ((pass_count.to_f / (pass_count + fail_count).to_f) * 100).round(2)
  end

end
