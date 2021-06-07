require_relative './item.rb'

class List
attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description=nil)
    description ||= ""
    return false if !Item.valid_date?(deadline)

    @items << Item.new(title, deadline, description)
    true
  end

  def size
    @items.length
  end

  def valid_index?(index)
    @items[index] != nil
  end

  def swap(idx_1, idx_2)
    return false if !valid_index?(idx_1) || !valid_index?(idx_2)
    @items[idx_1], @items[idx_2] = @items[idx_2], @items[idx_1]
    true
  end

  def [](idx)
    valid_index?(idx) ? @items[idx] : nil
  end

  def priority
    @items[0]
  end

  def print
    puts "------------------------------------------"
    puts label.upcase.center(42)
    puts "------------------------------------------"
    puts "Index | Item                 | Deadline   "
    @items.each_with_index do |item, i|
      puts "#{i.to_s.ljust(5)} | #{item.title.ljust(20)} | #{item.deadline}"
    end
    puts "------------------------------------------"
  end

  def print_full_item(index)
    if valid_index?(index)
      puts "------------------------------------------"
      puts "#{[index].ljust(30)} #{deadline}"
      puts "#{description}.ljust(40)"
    end
  end

  def print_priority
    print_full_item(0)
  end

  def down(index, amount=nil)
    return false if !valid_index?(index)
    amount ||= 1
    (index...index + amount).each do |i|
      @items[i], @items[i+1] = @items[i+1], @items[i] if i < size - 1
    end
    true
  end

  def up(index, amount=nil)
    return false if !valid_index?(index)
    amount ||= 1
    index.downto(index - amount).to_a.each do |i|
      @items[i], @items[i-1] = @items[i-1], @items[i] if i > 0
    end
    true
  end

  def sort_by_date!
    @items.sort_by! { |item| item.deadline }
  end
end
