class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.each_with_index.inject do |acc, (ele, idx)|
      acc ^ (ele + idx).hash
    end
  end
    
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
