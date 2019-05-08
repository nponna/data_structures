require 'byebug'
class QueueCircularArray
  # add from @rear end and remove from @front end

  def initialize
	  @front = -1
	  @rear = -1
	  @size_of_array = 5
	  @queue_array = Array.new(@size_of_array)
	end

  # should take constant time O(1)
  def enqueue(new_element)
    if is_empty?
     @front = @rear = 0
    elsif is_full
      puts "Queue is full or create another array and copy queue" 
      return
    else
      @rear = (@rear + 1) % @size_of_array
    end
    @queue_array[@rear] = new_element	
  end

  def is_empty?
    @front == -1 && @rear == -1
  end

  def is_full
    ((@rear + 1) % @size_of_array) == @front 
  end 	

  def dequeue
    if is_empty?
      puts "Queue is empty"
    elsif @front == @rear
      @front = @rear = -1  
    else
    	@front = (@front + 1) % @size_of_array
    end	
  end

  def front_peek
  	if is_empty?
  		puts "Queue is empty"
  	else
      puts "QUeue @front is #{@queue_array[@front]}"
  	end	
  end	

  def print_queue
  	if is_empty?
			puts "Queue is empty"
  	else
      print_circular_array(@queue_array)
  	end	
  end	

  def print_circular_array(array_to_print)
    if (@rear <= (@size_of_array - 1)) && (@rear >= @front)
    	printing(array_to_print,@front,@rear)
    else
    	printing(array_to_print,@front,@size_of_array-1)	
    	printing(array_to_print,0,@rear)
    end 
  end

  def printing(array_to_print,start_index,end_index)
  	for x in start_index..end_index
  		puts "#{array_to_print[x]}"
  	end
  end	
end

queue_instance = QueueCircularArray.new
queue_instance.print_queue
queue_instance.dequeue
queue_instance.enqueue(2)
queue_instance.enqueue(5)
queue_instance.enqueue(7)
queue_instance.enqueue(32)
queue_instance.enqueue(88)
queue_instance.print_queue
queue_instance.enqueue(89)
queue_instance.dequeue
queue_instance.enqueue(89)
queue_instance.print_queue


