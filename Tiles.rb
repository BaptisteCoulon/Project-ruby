class Tile

	attr_accessor :x, :y

	def initialize(x,y)
		@img = Image.new("Assets/grass.png")
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
class Terre
	
	attr_accessor :x, :y

	def initialize(x,y)
		@img = Image.new("Assets/sans titre 1.png")
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