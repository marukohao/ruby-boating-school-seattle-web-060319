class Instructor
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def pass_student(student, test_name)
    test = []
    if BoatingTest.all.any? {|boat_test| boat_test.student == student}
      BoatingTest.all.each do |boat_test|
        if boat_test.student == student
          boat_test.test_status = "passed"
          test << boat_test
        end
      end
    else
      return BoatingTest.new(student, test_name, "passed", self)
    end
    return test
  end

  def fail_student(student, test_name)
    test = []
    if BoatingTest.all.any? {|boat_test| boat_test.student == student}
      BoatingTest.all.each do |boat_test|
        if boat_test.student == student
          boat_test.test_status = "failed"
          test << boat_test
        end
      end
    else
      return BoatingTest.new(student, test_name, "failed", self)
    end
    return test
  end

end
