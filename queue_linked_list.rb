require 'byebug'
class QueueLinkedList
	def initialize
      @front = nil
      @rear = nil
	end

	def is_empty?
	  @front == nil && @rear == nil
	end	

	def enqueue(new_element)
		new_node = LinkedListNode.new(new_element)
    if is_empty?
      @front = @rear = new_node
    else
    	@rear.next = new_node
    	@rear = new_node
    end  	
	end	

	def dequeue
		if is_empty?
			puts "Nothing is to dequeue"
		elsif @front.next == nil
			@front = @rear = nil
    else
    	@front = @front.next
		end
	end

	def print_queue
  	if is_empty?
			puts "Queue is empty"
  	else
      print_node = @front
	  	while(print_node != nil) do
	  		puts "#{print_node.value}"
	  		print_node = print_node.next
	  	end
  	end	
  end	
end	

class LinkedListNode
	attr_accessor :value,:next
	def initialize(value)
		@value = value
		@next = nil
	end	
end	


queue_instance = QueueLinkedList.new
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