class Item
  attr_accessor :title, :description
  attr_reader :deadline
  def self.valid_date?(date_string)
    numbers = "1234567890"
    return false if date_string.length != 10
    return false if date_string[0..3].split("").any? { |char| !numbers.include?(char) }
    return false if date_string[5..6].to_i > 12 || date_string[8..9].to_i > 31
    true
  end

  def initialize(title, deadline, description)
    @title = title
    if Item.valid_date?(deadline)
      @deadline = deadline
    else
      raise "invalid date"
    end
    @description = description
  end

  def deadline=(new_deadline)
    if Item.valid_date?(new_deadline)
      @deadline = new_deadline
    else
      raise "invalid date"
    end
  end
end

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date