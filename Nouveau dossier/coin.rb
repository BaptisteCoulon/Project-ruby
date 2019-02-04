class Coin
	
	attr_accessor :rectangle, :active
	
	def initialize(x,y)
		@img = Image.load_tiles("coin_sheet.png",40,42)
		@x = x
		@y = y
		@active = true
		@rectangle = Rectangle.new(x,y,32,32)
	end
	
	def draw 
		@img[Gosu.milliseconds/100 %@img.size].draw(@x,@y,0)if@active
	end
	
end