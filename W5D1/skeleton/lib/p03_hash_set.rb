require 'byebug'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    value = key.hash
    if !include?(key)
      self[value] << key
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def include?(key)
    value = key.hash
    self[value].include?(key)
  end

  def remove(key)
    if include?(key)
      value = key.hash 
      self[value].delete(key)
      @count -= 1
    end
  end

  private
 
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num%num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(2 * num_buckets) { Array.new }
    old_store = @store
    @store = new_store
    @count = 0

    old_store.each do |bucket|
      bucket.each do |ele|
        insert(ele)
      end
    end
  end
end
