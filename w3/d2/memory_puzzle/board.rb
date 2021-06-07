require_relative "card.rb"

class Board
  def initialize
    @grid = Array.new {[]}
    @pairs = []
    until @pairs.length == 16
      new_card = Card.new
      unless @pairs.include?(new_card)
        @pairs << new_card 
        @pairs << new_card 
      end
    end
  end

  def populate
    @grid.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        value = @pairs.sample
        @grid[row_i][col_i] = @pairs.delete(value)
      end
    end
  end

  def render
    puts @grid
  end

  def won?
    
  end

  def reveal(guessed_pos)
    
  end
end