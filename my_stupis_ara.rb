# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
    rows = matrix.length
    columns = matrix[0].length
    size = rows*columns
    direction = 'side-left'
    row = 0
    col = 0
    circle = 0
    
    new_array = Array.new(size)
    for i in 0..size-1
       case direction
         when 'side-left'
           new_array[i] = matrix[row][col]
           if check_matrix(row,col-1,rows,columns,circle,direction)
              col = col-1
           else
              direction = 'down'
              row = row+1 
           end    
         when 'side-right'
           new_array[i] = matrix[row][col]
           if check_matrix(row,col+1,rows,columns,circle,direction)
              col = col+1
           else
              direction = 'up'
              circle = circle+1 
              row = row+1 
           end
         when 'down'
           new_array[i] = matrix[row][col]
           if check_matrix(row+1,col,rows,columns,circle,direction)
              row = row+1
           else
              direction = 'side-left'
              col = col-1 
           end
         when 'up' 
           new_array[i] = matrix[row][col]
           if check_matrix(row-1,col,rows,columns,circle,direction)
              row = row-1
           else
              direction = 'side-right'
              col = col+1 
           end
       end    
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