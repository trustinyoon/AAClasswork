class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n) {"_"} }
  end

  def valid?(position)
    (position[0] < @grid[0].length && position[0] > -1 ) && (position[1] < @grid[0].length && position[1] > -1 )
  end

  def empty?(position)
    @grid[position[0]][position[1]] == "_"
  end

  def place_mark(position, mark)
    raise "invalid mark" if !valid?(position) || !empty?(position)
    @grid[position[0]][position[1]] = mark
  end

  def print
    puts "_ " * @grid[0].length
    @grid.each { |row| puts row.join("|") }
  end

  def win_row?(mark)
    @grid.any? do |row|
      row.all? { |col| col == mark }
    end
    false
  end

  def win_col?(mark)
    @grid.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        return false if @grid[col_i][row_i] != mark
      end
    end
    true
  end

  def win_diagonal?(mark)
    streak_1 = 0
    streak_2 = 0
    i = 0
    while i < @grid[0].length
      streak_1 += 1 if @grid[i][i] == mark
      streak_2 += 1 if @grid[@grid[0].length - 1 - i][i] == mark
      i += 1
    end
    return true if streak_1 == @grid[0].length || streak_2 == @grid[0].length
    false
  end

  def win?(mark)
    return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    false
  end

  def empty_positions?
    @grid.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        return true if col == "_"
      end
    end
    false
  end
end
