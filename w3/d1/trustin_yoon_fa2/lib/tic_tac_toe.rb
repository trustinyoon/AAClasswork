require_relative 'board'
require_relative 'player'

class TicTacToe


    # This TicTacToe#play method is given for free and does not need to be modified
    # It is used to make your game playable.
    def play
        until @board.winner?(:X) || @board.winner?(:O)
            p "#{@current_player.mark}'s turn"
            @board.print
            self.play_turn
        end

        @board.print
        self.switch_players!
        p "#{@current_player.mark} has won!"
    end

    def initialize(size = nil)
      size == nil ? @board = Board.new(3) : @board = Board.new(size)
      @player_1 = Player.new(:X)
      @player_2 = Player.new(:O)
      @current_player = @player_1
    end

    def switch_players!
      @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end

    def play_turn
      @board[@current_player.get_position] = @current_player.mark
      switch_players!
    end
end
