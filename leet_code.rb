require 'byebug'
require 'set'
class LeetCode

	def most_common_word(paragraph, banned)
	    words_hash = Hash.new
	    words = paragraph.split(" ")
	    max = 0
	    word_banned = nil
	    words.each do |word|
	        word.downcase.gsub(/[^a-z0-9\s]/," ")
	        word = word.strip
	        if words_hash[word]
	          words_hash[word] += 1
	        elsif
	          words_hash[word] = 1 
	        end 
	        if max < words_hash[word]
	            max = words_hash[word]
	            word_banned = word
	        end    
	    end 
	    return word_banned
	end

	def longest_palindrome(s)
    substrings_array_forward = []
    substrings_array_reverse =[]
    max_length= 0
    palindrome = ""
    for i in 0..s.size-1
      str_rev = generate_desc(s,i,substrings_array_reverse)
      str_fwd = generate_asc(s, i,substrings_array_forward)
      length = str_fwd.length
      if str_rev == str_fwd
        if length > max_length
          palindrome = str_fwd 
          max_length = length
        end    
      else
        j =1
        while length - j > 1
          if str_rev[j..length-1] == str_fwd[0..length-1-j]
            if str_rev[j..length-1].length > max_length
              palindrome = str_rev[j..length-1]
              max_length = str_rev[j..length-1].length
              break
            else
            	break
            end	
          else
            j += 1 
          end    
        end    
      end   
    end
    return palindrome    
  end

	def generate_desc(string, i, substrings_array_reverse)
		 # byebug
	    if substrings_array_reverse[i]
	        return substrings_array_reverse[i]
	    else
	        if (i < 0) 
	          return  ""
	        elsif i == 0
	            substrings_array_reverse[i] = string[0]
	        else    
	            substrings_array_reverse[i] = generate_desc(string, i-1,substrings_array_reverse) + string[i]
	        end 
	    end
	    return substrings_array_reverse[i]
	end  

	def generate_asc(string, i,substrings_array_forward)
		 # byebug
	    if substrings_array_forward[i]
	        return substrings_array_forward[i]
	    else    
	        if (i < 0) 
	          return  ""
	        elsif i == 0
	            substrings_array_forward[i] = string[0]
	        else    
	            substrings_array_forward[i] = string[i] + generate_asc(string, i-1, substrings_array_forward)  
	        end
	    end
	    return substrings_array_forward[i]
	end

	def intersection_size_two(intervals)
	   new_hash = Hash.new
	   no_of_intervals = intervals.size 
	   count =0 
	   byebug
	   for x in 0..no_of_intervals-1
	       for y in intervals[x][0]..intervals[x][1]
	           if new_hash[y]
	              new_hash[y].add(x)  
	           else
	              new_hash[y] = Set.new
	              new_hash[y].add(x) 
	           end    
	       end
	   end
	   puts "Hash #{new_hash}"
	   new_hash.each do |key,value|
	       if value.length == no_of_intervals
	           count +=1
	           if count == 2
	               break;
	           end
	       else
	       end       
	   end
	   return count 
	end
end


lc = LeetCode.new
# lc.longest_palindrome("babad")
# you = lc.longest_palindrome("abadd")
# puts "#{you}"

boo = lc.intersection_size_two([[1, 3], [1, 4], [2, 5], [3, 5]])
puts "#{boo}"