require_relative "code"

class Mastermind
  def initialize(num)
    @secret_code = Code.random(num)
  end

  def print_matches(guess)
    puts @secret_code.num_exact_matches(guess)
    puts @secret_code.num_near_matches(guess)
  end

  def ask_user_for_guess
    puts "Enter a code"
    input = gets.chomp
    print_matches(Code.from_string(input))
    @secret_code == Code.from_string(input)
  end

end
