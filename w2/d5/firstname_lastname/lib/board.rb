class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(num)
      Array.new(num) {Array.new()}
    end

    def initialize(num, max_height)
      @max_height = max_height
      @stacks = Board.build_stacks(num)
      if num < 4 || max_height < 4
        raise "rows and cols must be >= 4"
      end
    end

    attr_reader :max_height

    def add(token, stack_idx)
      if @stacks[stack_idx].length < @max_height
        @stacks[stack_idx].unshift(token)
        return true
      end
      false
    end

    def vertical_winner?(token)
      @stacks.each do |stack|
        return true if stack.all? { |t| t == token } && stack.length == max_height
      end
      false
    end

    def horizontal_winner?(token)
      height = 0
      streak = 0
      while height < max_height
        @stacks.each do |stack|
          streak += 1 if stack[height] == token
        end
        return true if streak == @stacks.length
        streak = 0
        height += 1
      end
      false
    end

    def winner?(token)
      vertical_winner?(token) || horizontal_winner?(token)
    end
end
