class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? { |el| POSSIBLE_PEGS.keys.include?(el.upcase) } ? true : false
  end

  def self.random(num)
    arr = Array.new(num) {POSSIBLE_PEGS.keys.sample}
    Code.new(arr)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def initialize(arr)
    Code.valid_pegs?(arr) ? @pegs = arr.map(&:upcase) : raise_error 
  end

  def [](idx)
    @pegs[idx]
  end

  def length()
    pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index { |peg, idx| count += 1 if peg == @pegs[idx]}
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg, idx|
      if peg != @pegs[idx] && @pegs.include?(peg)
        count += 1
      end
    end
    count
  end

  def ==(instance)
    if self.length != instance.length
      false
    elsif self.num_exact_matches(instance) == self.length
      true
    else
      false
    end
  end
  
end
