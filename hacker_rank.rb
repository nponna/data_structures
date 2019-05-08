require 'prime'
require 'byebug'
class HackerRank
  def downToZero(n)
    steps_map = Hash.new
    steps_map[1] = 1
    steps_map[0] = 0
    steps = [find_steps(n,steps_map), find_steps(n-1,steps_map)+1].min

    puts "steps for #{n} --> #{steps}"
    return steps
  end

  # def find_steps(x,steps_map)
  # 	if steps_map[x]
  #     return steps_map[x]
  #   else
  #     return [find_steps(n,steps_map), find_steps(n-1,steps_map)+1].min	
  #   end	
  # end	

	# def find_steps(x,steps_map)
	#     if steps_map[x]
	#       return steps_map[x]
	#     else
	#     	if Math.sqrt(x).is_a? Integer
 #                sqrt_x = Math.sqrt(x)
 #                steps_map[x] = [find_steps(sqrt_x,steps_map),find_steps(sqrt_x,steps_map) +1].min +1 
 #                return steps_map[x]
 #            else
 #               divisor1,divisor2 = nil
	# 	        primes = Prime.take_while {|p| p <= x/2 }
	# 	        j = primes.size-1
	# 	        while(j >= 0) do
	# 	        	if x%primes[j]==0
	# 	                divisor1 = x/primes[j]
	# 	                divisor2 = primes[j]
	# 	                break;
	# 	            else
	# 	              j = j-1	
	# 	            end	
	# 	        end	
	# 	        if divisor1 == nil && divisor2 == nil
	# 	            return find_steps(x-1,steps_map) + 1
	# 	        else
	# 		        num_next = [divisor1,divisor2].max
	# 	            return [find_steps(num_next,steps_map),find_steps(num_next-1,steps_map) +1].min +1 
	# 	        end
 #            end    
	#     end    
	# end

	# Complete the maxSubarray function below.
def maxSubarray(arr)
   maxSub = Array.new
   maxSubValue = nil
   maxAnyValue = nil
   for i in 0..arr.size-1
	    k = i
	    #  subAdd = 0
	    #  while j >=0
	    #    subAdd = subAdd + arr[j]
	    #    j = j-1
	    #  end
	    #  maxSub[i] = subAdd
	     maxSub[i] = arr[i] + ( maxSub[i-1] ||0)
	     while k >=0
	      if k == i
	        if maxSub[i] > (maxSubValue || -Float::INFINITY)
	            maxSubValue = maxSub[i]
	        end
	        if maxSub[i] > (maxAnyValue || -Float::INFINITY)
	            maxAnyValue = maxSub[i]
	        end
	      else
	        if (maxSub[i] - maxSub[k]) > (maxSubValue || -Float::INFINITY)
	            maxSubValue = maxSub[i] - maxSub[k] 
	        end
	        if (maxSub[i] - maxSub[k]) > (maxAnyValue || -Float::INFINITY)
	            maxAnyValue = maxSub[i] - maxSub[k] 
	        end
	        if i > 1 # only when length of array greater than 3 that happens at index 2
		        x=k-2
		        while(x >= 0) do
              hell = x
              loop do 
							  if x== hell
							  	if (arr[i] + maxSub[x]) > (maxAnyValue || -Float::INFINITY)
					            maxAnyValue = arr[i] + maxSub[x]
					        end
				        else
				        	if (arr[i] + maxSub[x] - maxSub[hell]) > (maxAnyValue || -Float::INFINITY)
					            maxAnyValue = arr[i] + maxSub[x] - maxSub[hell]
					        end
				        end   
					      hell = hell -1
							  break if hell < 0
							end
              x = x -1
			    end
		    end    
	      end  
	      k = k-1
	     end
	   end

	#    sorted_array = arr.sort { |x,y| y <=> x } 
	#    sum_sorted_array = nil
	#    for z in 0..sorted_array.size-1
	#      if (sum_sorted_array || -Float::INFINITY)  > ((sum_sorted_array || 0) + sorted_array[z])
	#         break
	#      else
	#        sum_sorted_array = ((sum_sorted_array || 0) + sorted_array[z])
	#      end
	#    end
	   return [maxSubValue, maxAnyValue]
	end
end

hr = HackerRank.new
# hr.downToZero(94)
ab = hr.maxSubarray([1])
puts "ab #{ab}"
ab = hr.maxSubarray([-1, -2, -3, -4, -5, -6])
puts "ab #{ab}"
ab = hr.maxSubarray([1, -2])
puts "ab #{ab}"
ab = hr.maxSubarray([1, 2, 3])
puts "ab #{ab}"
ab = hr.maxSubarray([-10])
puts "ab #{ab}"
ab = hr.maxSubarray([1, -1, -1, -1, -1, 5])
puts "ab #{ab}"
# hr.downToZero(966514)
# hr.downToZero(812849)
# hr.downToZero(808707)
# hr.downToZero(360422)
# hr.downToZero(691410)
# hr.downToZero(691343)
# hr.downToZero(551065)
# hr.downToZero(432560)

# 966514
# 812849
# 808707
# 360422
# 691410
# 691343
# 551065
# 432560
# 192658
# 554548
# 27978
# 951717
# 663795
# 315528
# 522506
# 300432
# 412509
# 109052
# 614346
# 589115
# 301840
# 7273