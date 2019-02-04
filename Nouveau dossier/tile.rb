

class Tile

	attr_accessor :x, :y, :rectangle

	def initialize(x,y)
		@img = Image.new("blokas.png")
		@x = x
		@y = y
		
		@rectangle = Rectangle.new(x,y,@img.width,@img.height)
	end
	
	def draw 
		@rectangle.x = @x
		@rectangle.y = @y
		@img.draw(@x,@y,0)
	end
	
	def collides?(rect)
		return @rectangle.collides?(rect)
	end

end