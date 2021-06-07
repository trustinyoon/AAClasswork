# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum/(self.length * 1.0)
  end

  def median
    return nil if self.empty?
    if self.length.odd?
        self.sort[(self.length - 1)/2]
    elsif self.length.even?
        (self.sort[(self.length-1)/2] + self.sort[(self.length-1)/2 + 1])/2.0
    end
  end

  def counts
    hash = Hash.new(0)
    self.each { |el| hash[el] += 1 }
    hash
  end

  def my_count(arg)
    self.select { |el| el == arg }.length
  end

  def my_index(arg)
    self.each_with_index { |el, i| return i if arg == el }
    nil
  end

  def my_uniq
    hash = Hash.new(0)
    uniq = []
    self.each do |el|
        hash[el] += 1
        uniq << el if hash[el] == 1
    end
    uniq
  end

  def my_transpose
    transposed = Array.new(self.length) {Array.new(self[0].length)}
    self.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        transposed[row_i][col_i] = self[col_i][row_i]
      end
    end
    transposed

  end
end
