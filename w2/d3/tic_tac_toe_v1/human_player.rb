class HumanPlayer
  def initialize(mark_value)
    @mark_value = mark_value
  end

  attr_reader :mark_value

  def get_position
    puts " #{mark_value}'s turn: Enter a position in the format of 'row# col#' "
    position = gets.chomp
    raise "invalid format" if position.length != 3 || !"012".include?(position[0]) || !"012".include?(position[2])
    return [position[0].to_i, position[2].to_i]
  end

end

