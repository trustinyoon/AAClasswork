require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    salaries.has_key?(title)
  end

  def >(startup)
    self.funding > startup.funding
  end

  def hire(name, title)
    if valid_title?(title)
        employees << Employee.new(name, title)
    else
        raise "EROR"
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = salaries[employee.title]

    if funding >= salary
        employee.pay(salary)
        @funding -= salary
    else
        raise_error
    end
  end

  def payday
    employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    sum = 0
    employees.each { |employee| sum += salaries[employee.title] }
    sum/employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    startup.salaries.each { |title, salary| @salaries[title] = salary if !@salaries.has_key?(title) }
    @employees += startup.employees
    startup.close
  end
end
