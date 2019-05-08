require 'byebug'
module BinaryTree
	@is_binary_search_tree = true

  def height(root)
    if root == nil || root.data == nil
      return -1
    elsif root && root.data
      return [height(root.left),height(root.right)].max	+ 1 
    end  		
  end

  def level_order_traversal(root)
  	traversal_queue = Array.new
  	if root == nil || root.data == nil
  		return
  	elsif root && root.data
  		traversal_queue.push(root)
  	end

  	while(traversal_queue.size > 0) do
  		traversal_queue.push(traversal_queue.first.left) if traversal_queue.first.left
  		traversal_queue.push(traversal_queue.first.right) if traversal_queue.first.right
  		puts "#{traversal_queue.first.data}"
  		traversal_queue.shift
  	end					
  end	

  def pre_order_traversal(root)
  	if root == nil || root.data == nil
  		return
    elsif root && root.data
       puts "#{root.data}"
       pre_order_traversal(root.left)
       pre_order_traversal(root.right)
    end		
  end

  def in_order_traversal(root)
  	if root == nil || root.data == nil
  		return 
    elsif root && root.data
       in_order_traversal(root.left)
       puts "#{root.data}"
       in_order_traversal(root.right)
    end		
  end

	def post_order_traversal(root)
  	if root == nil || root.data == nil
  		return
    elsif root && root.data
      post_order_traversal(root.left)
      post_order_traversal(root.right)
      puts "#{root.data}"
    end		
  end

  def is_binary_search_tree()
 
end

class BinarySearchTree
	include BinaryTree

	attr_accessor :root
  def initialize()
    @root = Node.new(nil)
  end

  def insert(root,value)
    if root.data == nil 
      root.data = value
    elsif value > root.data && root.right == nil
      root.right = Node.new(value)
    elsif value > root.data && root.right 
      insert(root.right,value)
    elsif value <= root.data && root.left == nil
      root.left = Node.new(value)
    elsif value <= root.data && root.left
      insert(root.left,value)	
    end
  end

  def search(root,value)
  	if root == nil || root.data ==nil
  		return
  	else	
	  	if value == root.data
	  	 puts " Value found"
	  	 return root
	  	elsif value > root.data
	  	  search(root.right,value)
	  	elsif value <= root.data
	      search(root.left,value)
	  	end 
	  end	 
  end

  def minimum(root)
  	if root == nil || root.data == nil
  		puts "Tree empty"
  		return
  	elsif root && root.data
  		if root.left && root.left.data
  			minimum(root.left)
  		else
  			return root.data
  		end	
  	end	
  end

  def maximum(root)
  	if root == nil || root.data == nil
  		puts "Tree empty"
  		return
  	elsif root && root.data
  		if root.right && root.right.data
  			maximum(root.right)
  		else
  			return root.data
  		end	
  	end	
  end

  def find_node_deletion(root,value,parent)
  	if root == nil || root.data == nil
    	return
    elsif root && root.data
    	if root.data == value
    		delete_node(root,parent)
    	elsif value > root.data
    	  find_node_deletion(root.right,value,root)
    	else
    		find_node_deletion(root.left,value,root)
    	end 		
    end
  end

  def maximum_with_parent(root,parent)
  	if root == nil || root.data == nil
  		puts "Tree empty"
  		return
  	elsif root && root.data
  		if root.right && root.right.data
  			maximum(root.right,root)
  		else
  			return [root,parent]
  		end	
  	end	
  end	

  def delete_node(node,parent)
  	if node.right && node.right.data && node.left && node.left.data
      nodes = maximum_with_parent(node.left,node)
      # First delete leaf node
      if nodes[1].right.data == nodes[0].data
  			nodes[1].right = nil
  		else
  			nodes[1].left = nil
  		end
      if parent
    		if parent.right.data == node.data
    			parent.right = nodes[0]
    			nodes[0].right = node.right
    			nodes[0].left = nodes.left
    		else
    			parent.left = nodes[0]
    			nodes[0].right = node.right
    			nodes[0].left = nodes.left
    		end
    	else
    	  nodes[0].right = node.right
    		nodes[0].left = nodes.left
    		node = nodes[0]	
    	end
    elsif node.right && node.right.data
    	if parent
    		if parent.right.data == node.data
    			parent.right = node.right
    		else
    			parent.left = node.right
    		end	
    	else
    		node = node.right
    	end
    elsif node.left && node.left.data
    	if parent
    		if parent.right.data == node.data
    			parent.right = node.left
    		else
    			parent.left = node.left
    		end	
    	else
    		node = node.left
    	end
    elsif node.right == nil && node.left == nil
    	if parent
    		if parent.right.data == node.data
    			parent.right = nil
    		else
    			parent.left = nil
    		end	
    	else
    		node = nil
    	end	
    end
  end	


end

class Node
  attr_accessor :left,:right,:data
  def initialize(value)
  	@data = value
  	@left = nil
  	@right = nil
  end	
end



bst = BinarySearchTree.new
bst.insert(bst.root,10)
bst.insert(bst.root,15)
bst.insert(bst.root,25)
bst.insert(bst.root,0)
bst.insert(bst.root,5)
bst.insert(bst.root,85)
bst.insert(bst.root,5)
bst.insert(bst.root,55)
bst.insert(bst.root,20)
bst.insert(bst.root,75)
bst.insert(bst.root,45)
bst.insert(bst.root,57)


bst.search(bst.root,55)
bst.search(bst.root,66)
bst.minimum(bst.root)
bst.maximum(bst.root)

# height = bst.height(bst.root)
# puts "height #{height}"

# puts "Pre order traversal"
# bst.pre_order_traversal(bst.root)
# puts "In order traversal"
# bst.in_order_traversal(bst.root)
# puts "Post order traversal"
# bst.post_order_traversal(bst.root)
# puts "Level order traversal"
# bst.level_order_traversal(bst.root)

# bst.inorder_successor(bst.root,55)

# bst.inorder_successor(bst.root,0)


# bst2 = BinarySearchTree.new
# height = bst2.height(bst2.root)
# puts "height #{height}"

# puts "Pre order traversal"
# bst2.pre_order_traversal(bst2.root)
# puts "In order traversal"
# bst2.in_order_traversal(bst2.root)
# puts "Post order traversal"
# bst2.post_order_traversal(bst2.root)
# puts "Level order traversal"
# bst2.level_order_traversal(bst2.root)


# bst3 = BinarySearchTree.new
# bst3.insert(bst3.root,10)
# height = bst3.height(bst3.root)
# puts "height #{height}"

# puts "Pre order traversal"
# bst3.pre_order_traversal(bst3.root)
# puts "In order traversal"
# bst3.in_order_traversal(bst3.root)
# puts "Post order traversal"
# bst3.post_order_traversal(bst3.root)
# puts "Level order traversal"
# bst3.level_order_traversal(bst3.root)



