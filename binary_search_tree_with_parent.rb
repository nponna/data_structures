require_relative "binary_search_tree"

class BinarySearchTreeWithParent
	include BinaryTree
	attr_accessor :root

	def insert(root,data,parent)
		if root == nil
		  return Node.new(data,parent)
		elsif root
			if data > root.data && root.right == nil
				root.right = insert(root.right,data,root)
			elsif data > root.data && root.right !=nil
				insert(root.right,data,root)
			elsif data <= root.data && root.left == nil
				root.left = insert(root.left,data,root)
            elsif data <= root.data && root.left != nil
            	insert(root.left,data,root)
			end	
		end 
	end

	def inorder_successor(root,value,node)
		if root == nil
           return
        elsif root
        	if value == root.data
        		node = root
        		puts "Node for #{value} is #{node}"
        		return node
        	elsif value > root.data
        	   inorder_successor(root.right,value,node)
        	elsif value < root.data
        	   inorder_successor(root.left,value,node)
        	end   	   
        end	

	end	

	def find_inorder_successor(root,value)
		node = nil
		node = inorder_successor(root,value,node)
		if node
		  if node.right != nil
		  	minimum(node.right)
		  else
		  	if node.parent.right.data == node.data 
               puts " Node successor #{find_child_on_left(node).parent.data}"
		  	elsif node.parent.left.data == node.data
		  		puts " Node successor #{node.parent.data}"
		  	end	
		  end	
		else
		  puts "No node found"
		end	
	end

	def find_child_on_left(node)
		if(node.parent.right.data == node.data)
			find_child_on_left(node.parent)
		else
		  return node
		end	
	end

  def minimum(root)
  	if root == nil || root.data == nil
  		puts "Tree empty"
  	elsif root && root.data
  		if root.left && root.left.data
  			minimum(root.left)
  		else
  			puts "Minimum is #{root.data}"
  		end	
  	end	
  end	
	
end

class Node
	attr_accessor :data,:parent,:left,:right
	def initialize(data, parent)
		@data = data
		@parent = parent
		@left = nil
		@right = nil
	end
end	

bst11 = BinarySearchTreeWithParent.new
bst11.root = bst11.insert(bst11.root,10,nil)
bst11.insert(bst11.root,15,nil)
bst11.insert(bst11.root,25,nil)
bst11.insert(bst11.root,0,nil)
bst11.insert(bst11.root,5,nil)
bst11.insert(bst11.root,85,nil)
bst11.insert(bst11.root,5,nil)
bst11.insert(bst11.root,55,nil)
bst11.insert(bst11.root,20,nil)
bst11.insert(bst11.root,75,nil)
bst11.insert(bst11.root,45,nil)
bst11.insert(bst11.root,57,nil)

puts "In order traversal #{bst11.root}"
bst11.in_order_traversal(bst11.root)

bst11.find_inorder_successor(bst11.root, 55)
bst11.find_inorder_successor(bst11.root, 5)
bst11.find_inorder_successor(bst11.root, 20)