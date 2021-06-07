class Board
  def initialize
    @grid = Array.new(3) { Array.new(3) {"_"} }
  end

  def valid?(position)
    (position[0] < 3 && position[0] > -1 ) && (position[1] < 3 && position[1] > -1 )
  end

  def empty?(position)
    @grid[position[0]][position[1]] == "_"
  end

  def place_mark(position, mark)
    raise "invalid mark" if !valid?(position) || !empty?(position)
    @grid[position[0]][position[1]] = mark
  end

  def print
    puts "_ _ _"
    @grid.each { |row| puts row.join("|") }
  end

  def win_row?(mark)
    @grid.each { |row| return true if row[0] == row[1] && row[1] == row[2] && row[0] == mark }
    return false
  end

  def win_col?(mark)
    col_i = 0
    while col_i < 3
      return true if @grid[0][col_i] == @grid[1][col_i] && @grid[1][col_i] == @grid[2][col_i] && @grid[2][col_i] == mark
      col_i += 1
    end
    return false
  end

  def win_diagonal?(mark)
    return true if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2] && @grid[2][2] == mark
    return true if @grid[2][0] == @grid[1][1] && @grid[1][1] == @grid[0][2] && @grid[0][2] == mark
    return false
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
