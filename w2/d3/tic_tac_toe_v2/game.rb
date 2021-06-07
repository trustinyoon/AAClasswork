require_relative "./board.rb"
require_relative "./human_player.rb"
class Game
  def initialize(num, *players)
    @players = []
    players.each do |player|
      @players << HumanPlayer.new(player)
    end
    @board = Board.new(num)
    @current_player = @players[0]
  end

  def switch_turn
    @players.rotate!
    @current_player = @players[0]
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

