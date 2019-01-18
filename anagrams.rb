

#phase 1 
#goal is store all possible anagrams of string_1
#look through array of all possible anagrams
def first_anagram?(string, target)
  return false if str1.length != str2.length
  perms = anagram_perms(string.chars)
  perms.include?(target.chars)
end

def anagram_perms(array)
  return [array] if array.length <= 1

  first = array.shift 
  perms = anagram_perms(array)
  total_anagrams = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_anagrams << perm[0...i] + [first] + perm[i..-1]
    end
  end

  total_anagrams
end

#phase 2
def second_anagram?(str1, str2)
  return false if str1.length != str2.length
  str1.each_char do |ch|
    index = str2.chars.find_index(ch)
    str2.slice!(index) unless index.nil?
  end 
  str2.empty?
end 

#phase 3
def third_anagram?(str1, str2)
  return false if str1.length != str2.length
  str1.chars.sort == str2.chars.sort
end

#phase 4
def fourth_anagram?(str1, str2)
  return false if str1.length != str2.length
  letters = Hash.new(0) # space complexity O(1) max 26
  str1.each_char { |ch| letters[ch] += 1} #O(n)
  str2.each_char do |ch| #O(n)
    return false if letters[ch] == 0 # O(1)
    letters[ch] -= 1 #O(1)
  end 
  true 
end


if __FILE__ == $PROGRAM_NAME
  # p first_anagram?("ddoasfasfa","yab")
  # p second_anagram?("zmxncvb", "mnbvcxz")
  p third_anagram?("zmxncvb", "mnbvcxz")
end