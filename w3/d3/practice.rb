def range(start, ender)
  return [] if start > ender
  [start] + range(start+1, ender)
end

def exp1(b, n)
  return 1 if n == 0
  b * exp1(b, n-1)
end

def exp2(b, n)
  return 1 if n == 0
  if n.even?
    exp2(b, n/2) * exp2(b, n/2)
  else
    b * (exp2(b, (n-1)/2) * exp2(b, (n-1)/2))
  end
end

def deep_dup
  return self unless self.is_a? Array
  output = []
  self.each do |el|
    output += (el.deep_dup)
  end
  output
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.dup

robot_parts_copy[1] << "LEDs"
# but it does
p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]