class Array

  def uniq
    new_arr = []
    self.each do |ele|
      new_arr << ele if !new_arr.include?(ele)
    end
    new_arr
  end

  def two_sum
    new_arr = []
    self.each_with_index do |ele1, idx1|
      self.each_with_index do |ele2, idx2|
        new_arr << [idx1,idx2] if idx2 > idx1 && ele1 + ele2 == 0
      end
    end
    new_arr
  end

  def my_transpose
    new_arr = []
    (0...self.length).each do |row_idx|
      new_row = []
      (0...self.length).each do |col_idx|
        new_row << self[col_idx][row_idx]
      end
      new_arr << new_row
    end
    new_arr
  end

end

def stock_picker(array)   
  max_profit = 0
  best_day = []

  array.each_with_index do |buy, i1|
    array.each_with_index do |sell, i2|
      current_profit = sell - buy
      if max_profit <= current_profit && i2 > i1
        max_profit = current_profit
        best_day = [i1,i2]
      end
    end
  end

  best_day
end


class TowersOfHanoi
  attr_accessor :stack1, :stack2, :stack3
  def initialize
    @stack1 = [5,4,3,2,1]
    @stack2 = []
    @stack3 = []
  end

  def move(direction)   # direction is array
    from, to = direction
    raise "Invalid stack" if !from.between?(0,2) || !to.between?(0,2)
    case 
    when
  end

  def play
    print "Enter a position in a form of '1 3': "
    input = gets.chomp.split(" ").map(&:to_i)
    
    # case input
    # when 1
    # when 2
    # when 3

  end

end