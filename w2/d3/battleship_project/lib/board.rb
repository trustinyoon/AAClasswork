class Board
  attr_reader :size, :length

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
    @length = n
  end

  def [](pair)
    @grid[pair[0]][pair[1]]
  end

  def []=(position, value)
    x, y = position
    @grid[x][y] = value
  end

  def num_ships
    count = 0
    @grid.each do |row|
      row.each { |value| count += 1 if value != :N }
    end
    count
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship!"
      true
    else
      self[position] = :X
      false
    end
  end

  def place_random_ships
    until num_ships == (0.25 * size)
      self[[rand(length), rand(length)]] = :S
    end
  end

  def hidden_ships_grid
    hidden = Array.new(length) {Array.new(length, :N)}
    @grid.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        if self[[row_i, col_i]] == :X
          hidden[row_i][col_i] = :X
        else
          hidden[row_i][col_i] = :N 
        end
      end
    end
    hidden
  end

  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

end
