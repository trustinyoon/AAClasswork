class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
    @secret_word.split("").map.with_index { |letter, i| i if char == letter}.compact
  end

  def fill_indices(char, arr)
    arr.each { |idx| @guess_word[idx] = char}
  end

  def try_guess(char)

    if already_attempted?(char)
      p "that has already been attempted"
      false
    else 
      @attempted_chars << char
      matches = get_matching_indices(char)
      matches[0] ? fill_indices(char, matches) : @remaining_incorrect_guesses -= 1
      true
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    input = gets.chomp
    try_guess(input)
  end

  def win?
    p @secret_word
    if @guess_word.join("") == @secret_word
      p "WIN"
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      true
    else
      false
    end
  end
end

