class MyLinkedList

=begin
    Initialize your data structure here.
=end
    attr_accessor :head
    def initialize()
        @head = nil
    end


=begin
    Get the value of the index-th node in the linked list. If the index is invalid, return -1.
    :type index: Integer
    :rtype: Integer
=end
    def get(index)
        if @head
           curr_node = @head
           i = 0 
           while curr_node != nil
               if index == i
                 return curr_node.value
               else
                 curr_node = curr_node.nextLink 
               end 
               i+=1
           end
           return -1
        else
          return -1  
        end 
    end


=begin
    Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
    :type val: Integer
    :rtype: Void
=end
    def add_at_head(val)
        new_node = Node.new(val)
        if @head
           new_node = Node.new(val)
           new_node.nextLink = @head
        end
        @head = new_node  
    end


=begin
    Append a node of value val to the last element of the linked list.
    :type val: Integer
    :rtype: Void
=end
    def add_at_tail(val)
        new_node = Node.new(val)
        if @head
           curr_node = @head
           while curr_node.nextLink != nil
               curr_node = curr_node.nextLink
           end
           curr_node.nextLink =  new_node
        else
          @head = new_node  
        end    
    end


=begin
    Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
    def add_at_index(index, val)
        new_node = Node.new(val)
        if @head
           curr_node = @head
           prev_node = nil 
           i = 0 
           while curr_node != nil
               if index == i
                 new_node.nextLink = curr_node
                 prev_node.nextLink = new_node if prev_node 
               else
                 prev_node = curr_node
                 curr_node = curr_node.nextLink
               end
               i+=1
           end
        else
          if index == 1
             @head = new_node 
          end
        end
    end


=begin
    Delete the index-th node in the linked list, if the index is valid.
    :type index: Integer
    :rtype: Void
=end
    def delete_at_index(index)
        if @head
           curr_node = @head
           prev_node = nil 
           i = 0 
           while curr_node != nil
               if index == i
                 @head = curr_node.nextLink if index == 0
                 prev_node.nextLink = curr_node.nextLink if prev_node 
               else
                 prev_node = curr_node  
                 curr_node = curr_node.nextLink 
               end 
               i+=1
           end
        end
    end
end

class Node

    attr_accessor :value,:nextLink 
    
    def initialize(value)
        @value = value
        @nextLink = nil
    end
end    

# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList.new()
# param_1 = obj.get(index)
# obj.add_at_head(val)
# obj.add_at_tail(val)
# obj.add_at_index(index, val)
# obj.delete_at_index(index)