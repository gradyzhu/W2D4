
def bad_two_sum?(arr, target)
  i = 0 
  while i < arr.length - 1 
    j = i + 1
    while j < arr.length 
      return true if arr[i] + arr[j] == target 
      j += 1
    end 
    i += 1
  end 
  false
end

def okay_two_sum?(arr, target)
  sorted_arr = arr.sort # O(N*log N)
  i = 0
  j = arr.length - 1 
  while i < j
    curr_sum = arr[i] + arr[j]
    case curr_sum <=> target 
    when 1 
      j -= 1
    when -1
      i += 1
    when 0
      return true 
    end 
  end
  false
end


array = [0,1,5,7]
p bad_two_sum?(array,6) #true
p bad_two_sum?(array,10) #false
array = [-12,-5,-2,1,7,10]
p bad_two_sum?(array,-1) #true
p bad_two_sum?(array,1) #false 