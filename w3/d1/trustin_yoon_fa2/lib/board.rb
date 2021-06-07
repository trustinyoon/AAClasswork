class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end

    def initialize(size)
      @size = size
      @grid = Array.new(size) {Array.new(size)}
    end

    def size
      @size
    end

    def [](pos)
      row_i, col_i = pos
      @grid[row_i][col_i]
    end

    def []=(pos, mark)
      row_i = pos[0]
      col_i = pos[1]
      @grid[row_i][col_i] = mark
    end

    def complete_row?(mark)
      @grid.any? do |row|
        row.all? do |spot|
          spot == mark
        end
      end
    end

    def complete_col?(mark)
      streak = 0

      @grid.each_with_index do |row, row_i|
        row.each_with_index do |col, col_i|
          @grid[col_i][row_i] == mark ? streak += 1 : streak = 0
          return true if streak == size
        end
      end
      return false
    end

    def complete_diag?(mark)
      streak_1 = 0
      streak_2 = 0

      @grid.each_with_index do |row, row_i|
        row.each_with_index do |col, col_i|
          streak_1 += 1 if @grid[row_i][col_i] == mark
          streak_2 += 1 if @grid[size - row_i - 1][col_i] == mark
        end
      end
      if streak_1 == size || streak_2 == size
        return true
      else
        return false
      end
    end

    def winner?(mark)
      complete_row?(mark) || complete_col?(mark) || complete_diag?(mark) ? true : false
    end
end
