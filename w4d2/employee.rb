class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end

class Manager < Employee
  
  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
    @higher_ups = []
  end

  def bonus(multiplier)
    total_salaries = self.salary

    if self.is_a?(Manager)

    end

    if !higher_ups.empty?
      self.employees.each {|employee| total_salaries += employee.salary}
    end
       
    total_salaries * multiplier
  end


  # def higher_ups_total_salary
  #   total_sum = 0
  #   super
  #   self.higher_ups.each {|boss| total_sum += boss.salary}
  #   total_sum
  # end


end

