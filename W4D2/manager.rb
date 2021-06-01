require_relative "employee.rb"
class Manager < Employee

    

    def initialize(title, salary, boss)
        super (title, salary, boss)
        @employees = []
    end

    def bonus(multiplier)
        #total salary of all subemployees * multiplier
        self.total_salary * multiplier
    end

    def total_salary
        sum = 0
        @employees.each do |employee|
            sum += employee.salary 
        end
        sum
    end

    private
    attr_reader :salary
end