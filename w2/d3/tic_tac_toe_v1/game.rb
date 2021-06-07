require_relative "./board.rb"
require_relative "./human_player.rb"
class Game
  def initialize(player_1_mark, player_2_mark)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @board = Board.new
    @current_player = @player_1
  end

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def play
    while @board.empty_positions?
      @board.print
      @board.place_mark(@current_player.get_position, @current_player.mark_value)
      if @board.win?(@current_player.mark_value)
        return puts "#{@current_player.mark_value} VICTORY" 
      else
        switch_turn
      end
    end
    puts "DRAW"
  end
end

g = Game.new("X", "O")
g.play