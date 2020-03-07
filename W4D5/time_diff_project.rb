require 'benchmark'
require 'byebug'
# def my_min(arr)
# #   min = arr.first
# #   arr.each_with_index do |ele, i1|
# #     arr.each_with_index do |ele2, i2|
# #       if i2 > i1 && ele < ele2
# #         min = min < ele ? min : ele
# #       end
# #     end
# #   end
# #   min
# # end


# def my_min(arr)
#   min = arr.first
#   i = 0
#   while i < arr.length - 1
#     min = arr[i] if arr[i] < arr[i+1] && arr[i] < min
#     i += 1
#   end
#   min
# end



# # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# # p my_min(list)


# #PHASE 1 - Time complexity N^3

def sub_sums(arr)
  sub_arr = []
  (0...arr.length).each do |start_idx|
    (start_idx...arr.length).each do |end_idx|
      sub_arr << arr[start_idx..end_idx]
    end
  end
  # p sub_arr.length
  max = 0
  sub_arr.each do |sub|
    current_sum = sub.sum
    if current_sum > max
      max = current_sum
    end
  end
  max
end

# list = [2, 3, -6, 7, -6, 7]
# p sub_sums(list) # => 8 (from [7, -6, 7])

#PHASE 2: O(n)

# def sub_sums(arr)
#   largest_sum = arr.first
#   current_sum = 0
#   arr.each do |ele|
#     # debugger
#     current_sum += ele
#     if current_sum > largest_sum
#       largest_sum = current_sum
#     end
#     if current_sum < 0
#       current_sum = 0
#     end
#   end
#   largest_sum
# end

puts Benchmark.measure {
  5_000.times do
    sub_sums([5,3,1])
  end
}

# list = [5, 3, -7]
# p sub_sums(list)





