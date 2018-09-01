module ArrayRelated
  require 'logger'
  logger = Logger.new(STDOUT)

  def pivot_index(nums)
      sum = 0
      sum_right = 0
      for i in nums do
       sum += i
      end
      for i in 1..nums.length-2
        sum_right += nums[i-1] 
        if (sum_right == (sum - nums[i] - sum_right))
          return i
        end    
      end
      return -1      
  end

  def dominant_index(nums)
    biggest_element = nil
    biggest_element_i = nil
      i =0
      nums.each do |num|
          if(biggest_element)
              if (num > biggest_element)
                biggest_element = num
                biggest_element_i = i  
              end       
          else
              biggest_element = num
              biggest_element_i = i  
          end 
          i +=1
      end
      j =0
      nums.each do |num|
          unless biggest_element_i == j
            logger.info("User-input: #{2*num} #{j}")
            unless(biggest_element >= 2*num)
                x = num
                return -1
            end
          end
          j +=1 
      end 
      return biggest_element_i  
          
  end

  def plus_one(digits)
      j = (digits.length) - 1
      i = j
      while j >= 0 do    
        if(digits[j] < 9) 
          digits[j] +=1
          return digits  
        end
          digits[j] = 0
        j= j- 1  
      end
      k=0
      new_digits = Array.new(i+2)
      new_digits[k] = 1

      digits.each do |digit|
          k+=1
          new_digits[k] = digit
      end    
      return new_digits
  end

def find_diagonal_order(matrix)

    direction = 'up'
    m = matrix.length
    if m > 0
        n = matrix[0].length
        row = 0
        col = 0
        matrix_array = Array.new(m*n)
        for k in 0..((m*n)-1)

            case direction
            when 'up'
                matrix_array[k] = matrix[row][col]
                a = check_in_matrix(row-1,col+1,m,n)
                b = check_in_matrix(row,col+1,m,n)
                c = check_in_matrix(row+1,col,m,n)

                if a
                  col = col+1
                  row = row-1
                elsif b
                  col = col +1  
                  direction= 'down'
                elsif c
                  row = row+1
                  direction = 'down'
                end

            when 'down'
              matrix_array[k] = matrix[row][col]   
              a = check_in_matrix(row+1,col-1,m,n)
              b = check_in_matrix(row+1,col,m,n)
              c = check_in_matrix(row,col+1,m,n)
              if a
                  col = col-1
                  row = row+1
              elsif b
                  row = row+1
                  direction= 'up'
              elsif c
                  col = col +1
                  direction = 'up'
              end    
            end
        end
        return matrix_array
    else
      return [] 
    end    
end

def check_in_matrix(row,col,m,n)
    (row < m && row >=0) && (col < n && col>=0)
end     
end