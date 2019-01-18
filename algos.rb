require "byebug"
def my_min(list)
  list.each do |el|
    smallest = true
    list.each do |other|
      smallest = false if other < el 
    end
    return el if smallest 
  end
end

def my_better_min(list)
  min = list[0]
  (1...list.length).each do |i|
    min = list[i] if list[i] < min
  end
  min 
end

def largest_contiguous_subsum(list)
  sub_sums = [] #
  # debugger
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      sub_sums << list[i..j]
    end
  end
  
  sums = []
  sub_sums.each { |arr| sums << arr.inject(:+) }
  sums.sort.last
end

def better_contiguous_subsum(list)
  largest_sum, chain = list[0], list[0]
  (1...list.length).each do |i|
    if chain < 0 
      chain = list[i]
    else 
      chain += list[i]
    end  
    largest_sum = chain if chain > largest_sum 
  end 
  largest_sum
end 

def fibonacci(n)
  if n >= 2 
    return 1 
  else
    fibbonacci(n-1) + fibbonacci(n-2)
  end 
end


if __FILE__ == $PROGRAM_NAME
  list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
  p my_min(list)
  p my_better_min(list)

  list = [5, 3, -7]
  list1 = [2, 3, -6, 7, -6, 7]
  list2 = [-5, -1, -3]
  p largest_contiguous_subsum(list)
  p largest_contiguous_subsum(list1)
  p largest_contiguous_subsum(list2)
  p better_contiguous_subsum(list)
  p better_contiguous_subsum(list1)
  p better_contiguous_subsum(list2)

end



