require 'benchmark'
# def first_anagram?(str1, str2)
#   # anagrams = []
#   # str_arr = str1.chars
#   # str1.length.times do
#   #   last_ele = str_arr.pop
#   #   str_arr.unshift(last_ele)
#   #   anagrams << str_arr.join("")
#   # end
#   # anagrams
# end

# def anagrams(arr)
#   letters = arr 
#   return [letters] if letters.empty?
  
#   prev = anagrams(letters[1..-1])
#   new = prev.map { |sub| sub << letters[0] }
#   output = []
#   output << new
#   (new.length - 1).times do
#     temp = new 
#     output << temp.rotate(1)
#   end
#   output
# end

def first_anagram?(str1, str2) # (n!)
  letters = str1.chars
  anagrams = letters.permutation.to_a
  letters2 = str2.chars
  anagrams.include?(letters2)
end

# p first_anagram?("elvis", "lives")    #=> true
# p anagrams(['a','b'])   #=> true

def second_anagram?(str1, str2) #better than the first ( n^2 )
  str1.each_char do |char|
    second_idx = str2.index(char)
    str2[second_idx] = "" unless second_idx == nil
  end
  str2.chars.empty?
end


# first_anagram?("supercalifragilistic", "supercalifragilistop")    #=> false
# p second_anagram?("elvis", "lives") 

def third_anagram?(str1, str2)
  letters1 = str1.chars
  letters1.sort!
  letters2 = str2.chars
  letters2.sort!
  
  letters1 == letters2
end

# p third_anagram?("elvis", "lives") 
# p third_anagram?("supercalifragilistic", "supercalifragilistop")    #=> false



def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char{|el| hash1[el] += 1}
  str2.each_char{|el| hash2[el] += 1}
  hash1 == hash2
end

def bonus_anagram?(str1, str2)
  hash = Hash.new(0)
  str1.each_char{|el| hash[el] += 1}
  str2.each_char{|el| hash[el] += 1}
  hash.values.none?{|value| value.odd?}
end

# p fourth_anagram?("supercalifragilistic", "supercalifragilistop")

puts Benchmark.measure {
  500_000.times do
    second_anagram?("supercalifragilistic", "supercalifragilistop")
  end
}
# puts Benchmark.measure {
#   500_000.times do 
#     third_anagram?("supercalifragilistic", "supercalifragilistop")
#   end
# }
puts Benchmark.measure {
  500_000.times do 
    fourth_anagram?("supercalifragilistic", "supercalifragilistop")
  end
}

# puts Benchmark.measure {
#   500_000.times do 
#     bonus_anagram?("supercalifragilistic", "supercalifragilistop")
#   end
# }

def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |ele, i|
    arr.each_with_index do |ele2, j|
      if j > i && ele + ele2 == target_sum
        return true
      end
    end
  end
  false
end

def two_sum?(arr, target_sum)
  current_sum = arr.first
  arr.each do |ele|
    
  end
end

arr = [0, 1, 5, 7]
two_sum?(arr, 6)