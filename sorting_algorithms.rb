require "byebug"
class SortingAlgorithms

  # Time complexity is O(n^2)
  def selection_sort(input_array)
  	for i in 0..input_array.size-2
  		minimum = input_array[i]
  		minimum_index = i
  		for j in i+1..input_array.size-1
  			if input_array[j] < minimum
  				minimum = input_array[j]
  				minimum_index = j
  			end	
        end
        if i != minimum_index
          input_array[minimum_index] = input_array[i]
          input_array[i] = minimum
        end	 
  	end
  	puts "Sorted array selection_sort #{input_array}"
  end

  # Time complexity is O(n^2)
  def bubble_sort(input_array)	
  	j=2
  	while(j < input_array.size)
  		swap=false
  		# puts "array bubble_sort #{input_array}"
	    for i in 0..(input_array.size-j)
	  		if input_array[i] > input_array[i+1]
	  			temp = input_array[i+1]
	  			input_array[i+1] = input_array[i]
	  			input_array[i] = temp
	  			swap=true
	  		end	
	  	end
	  	# puts "Sorted array bubble_sort #{input_array}"
	  	j+=1
	  	if swap == false
	  		break;
	  	end	
    end
    puts "Sorted array bubble_sort #{input_array}"
  end

  def insertion_sort(input_array)
  	for i in 1..input_array.size-1
  	  temp = input_array[i]
  	  while i>0 do 
	  	  if temp < input_array[i-1]
          input_array[i] = input_array[i-1]
          input_array[i-1] = temp
	      end
	      i -= 1
      end	
  	end
  	puts "Sorted array insertion_sort #{input_array}"	
  end	


  def merge_sort(input_array)
  	array_size = input_array.size
  	sorted_part_one = sorted_part_two = [] 
  	if array_size > 1
	    mid_point = array_size/2
	    sorted_part_one = merge_sort(input_array[0..mid_point-1])
	    sorted_part_two = merge_sort(input_array[mid_point..array_size-1])

	    x = y = z = 0
	    while(y < sorted_part_one.size && z < sorted_part_two.size) do
	    	if(sorted_part_one[y] < sorted_part_two[z])
	        input_array[x] = sorted_part_one[y]
	        x += 1
	        y += 1
	    	else
	    		input_array[x] = sorted_part_two[z]
	        x += 1
	        z += 1
	    	end	
	    end

	    while(y < sorted_part_one.size) do
	    	input_array[x] = sorted_part_one[y]
	      x += 1
	      y += 1
	    end

	    while(z < sorted_part_two.size) do
	    	input_array[x] = sorted_part_two[z]
	      x += 1
	      z += 1
	    end
    end		
    return input_array
  end	

  def quick_sort(input_array)
  	size = input_array.size
  	if size > 1
	  	pivot_index = (rand * size).floor
	  	pivot = input_array[pivot_index]
	  	partition_index = 0
	  	if (pivot_index != size-1)
		  	temp = input_array[size-1]
		  	input_array[size-1] = pivot
		  	input_array[pivot_index] = temp
		  	pivot_index = size-1
		  end
		  for j in 0..size-2
        if (input_array[j] <= pivot)
        	temp = input_array[partition_index]
          input_array[partition_index] = input_array[j]
          input_array[j] = temp
          partition_index += 1
        end	
		  end	
      temp = input_array[partition_index]
      input_array[partition_index] = pivot
      input_array[pivot_index] = temp
      input_array_left = quick_sort(input_array[0..(partition_index-1)]) if partition_index > 0
      input_array_right = quick_sort(input_array[(partition_index+1)..(size-1)]) if partition_index < (size-1)
      input_array = (input_array_left || []) + [input_array[partition_index]] + (input_array_right || [])
	  end	

    return input_array
  end	


end

sorting = SortingAlgorithms.new
sorting.selection_sort([8,6,5,9,0,81,27,52,0])
sorting.selection_sort([8,6,78,9,0,100,27,790,90])
sorting.selection_sort([87,91,78,9,0,100,297,790,90])
sorting.bubble_sort([8,6,5,9,0,81,27,52,0])
sorting.bubble_sort([8,6,78,9,0,100,27,790,90])
sorting.bubble_sort([87,91,78,9,0,100,297,790,90])
sorting.insertion_sort([8,6,5,9,0,81,27,52,0])
sorting.insertion_sort([8,6,78,9,0,100,27,790,90])
sorting.insertion_sort([87,91,78,9,0,100,297,790,90])
merge_sort = sorting.merge_sort([8,6,5,9,0,81,27,52,0])
puts "Sorted array merge_sort #{merge_sort}"
merge_sort = sorting.merge_sort([8,6,78,9,0,100,27,790,90])
puts "Sorted array merge_sort #{merge_sort}"
merge_sort = sorting.merge_sort([87,91,78,9,0,100,297,790,90])
puts "Sorted array merge_sort #{merge_sort}"

quick_sort = sorting.quick_sort([8,6,5,9,0,81,27,52,0])
puts "Sorted array quick_sort #{quick_sort}"
quick_sort = sorting.quick_sort([8,6,78,9,0,100,27,790,90])
puts "Sorted array quick_sort #{quick_sort}"
quick_sort = sorting.quick_sort([87,91,78,9,0,100,297,790,90])
puts "Sorted array quick_sort #{quick_sort}"

