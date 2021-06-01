class Employee

    def initialize(title, salary, boss)
        @title = title   
        @boss = Manager.new()
        @salary = salary
        
    end

    def bonus(multiplier)
        @salary * multiplier
    end





end
