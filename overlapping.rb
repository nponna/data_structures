class Overlapping
	def overlapping_area(b1,t1,b2,t2)
       width = distance(b1,b2,t1,t2,"width")
       height = distance(b1,b2,t1,t2,"height")
       if width <= 0 || height <=0
       	  return false
       else
       	 return width*height
       end	
	end

	def distance(b1,b2,t1,t2,measure)
		if measure == "width"
		  return ([t1.x,t2.x].min - [b1.x,b2.x].max)
		elsif measure == "height"
		  return ([t1.x,t2.x].min - [b1.x,b2.x].max)
		end			
	end	
end

class Coordinates
  attr_accessor :x,:y

  def initialize(x,y)
  	@x=x
  	@y=y
  end	
end


ol = Overlapping.new
area = ol.overlapping_area(Coordinates.new(2,3), Coordinates.new(4,6), Coordinates.new(3,3), Coordinates.new(9,6))
puts "AREA #{area}"