class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    accumulator ||= self.first
    self.each do |el|
      accumulator = prc.call(accumulator)
    end
    accumulator
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  (2...num).none? { |factor| num % factor == 0 }
end

def primes(num)
  primes = []
  factor = 2
  until primes.length == num
    primes << factor if is_prime?(factor)
    factor += 1
  end

  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  factorials = []
  factor = 0
  until factorials.length == num
    factorials << factorial(factor)
    factor += 1
  end

  factorials
end

def factorial(num)
  return 1 if num <= 1
  num * factorial(num-1)
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new {[]}
    self.each_with_index do |el, idx|
      hash[el] = []
    end
    hash
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    # current_streak = 1
    # split = self.split("")
    # split.each_with_index do |char, idx|
    #   if char == split[idx+1] && idx < split.length - 1
    #     current_streak += 1
    #   else
    #     current_streak = 1
    # end
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    
  end

  private
  def self.merge(left, right, &prc)
    middle = self[self.length/2]
    merge(left) + middle + merge(right)
  end
end
