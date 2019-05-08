 # @param {Integer[][]} matrix
  # @return {Integer[]}
  def spiral_order(matrix)
      rows = matrix.length
      if rows > 0
        columns = matrix[0].length
        size = rows*columns
        direction = 'side-right'
        row = 0
        col = 0
        circle = 0
        puts "Im here"
        new_array = Array.new(size)
        for i in 0..size-1

           case direction
             when 'side-left'
               puts "Array side-left #{new_array}, i #{i}"
               new_array[i] = matrix[row][col]
               a = check_matrix(row,col-1,rows,columns,circle,direction)
               b = check_matrix(row-1,col,rows,columns,circle+1,'up')
               puts "b, #{b}, #{row-1} #{col},#{rows}, #{columns}, #{circle+1}, #{direction}"
               if a
                  col = col-1
               elsif b 
                  direction = 'up'
                  circle = circle+1  
                  row = row-1 
               end    
             when 'side-right'
               puts "Array side-right #{new_array}, i #{i}"
               new_array[i] = matrix[row][col]
               a = check_matrix(row,col+1,rows,columns,circle,direction)
               b = check_matrix(row+1,col,rows,columns,circle,'down')
               if a
                  col = col+1
               elsif b
                  direction = 'down'
                  row = row+1 
               end
             when 'down'
               puts "Array down #{new_array}, i #{i}"
               new_array[i] = matrix[row][col]
               a = check_matrix(row+1,col,rows,columns,circle,direction)
               b = check_matrix(row,col-1,rows,columns,circle,'side-left')
               if a
                  row = row+1
               elsif b
                  direction = 'side-left'
                  col = col-1 
               end
             when 'up' 
               # puts "Array up #{new_array}, i #{i} , row #{row} col #{col}"
               new_array[i] = matrix[row][col]
               a = check_matrix(row-1,col,rows,columns,circle,direction)
               b = check_matrix(row,col+1,rows,columns,circle,'side-right')
               if a
                  row = row-1
               elsif b
                  direction = 'side-right'
                  col = col+1 
               end
           end    
        end
        return new_array
      else
        return []
      end      
  end


  def check_matrix(row,col,no_row,no_col,circle,direction)
      row_upper = no_row
      row_lower = 0
      col_upper = no_col
      col_lower = 0
      
      case direction
            when 'side-left'
              col_lower = circle
            when 'side-right'
              col_upper =  no_col - circle
            when 'down' 
              row_upper =  no_row - circle
            when 'up'
             row_lower = circle
        end 
      row < row_upper && row >= row_lower && col < col_upper && col >= col_lower 
    
  end 