class Cheese

	attr_accessor :x, :y, :active, :rectangle

	def initialize(x,y)
		@img = Image.new("Assets/coin_sheetbis.png")
		@x = x
		@y = y
		@active = true
		@rectangle = Rectangle.new(x,y,@img.width,@img.height)
	end
	
	def draw
		if @active		
			@rectangle.x = @x
			@rectangle.y = @y
			@img.draw(@x,@y,0)
		end
	end
	
	def collides?(rect)
		return @rectangle.collides?(rect)
	end
end