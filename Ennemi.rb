class Ennemi
	attr_accessor :rectangle, :active
	def initialize(x,y,direction)
	
		@@image ||= Image.new("Assets/Piege_1.png")
		
		@start_x = x
		@start_y = y
		
		@x = x
		@y = y
		
		@active = true
		
		@direction = direction
		
		@time = 0.0
		@time_longrange = 0.0
		@time_vertical = 0.0
		
		@rectangle = Rectangle.new(0,0,@@image.width,@@image.height)

	end
	
	def update
		@time += 0.07
		@time_longrange += 0.02
		@time_vertical +=0.05
		if @direction == "vertical"
		
			@y = @start_y + Math.sin(@time_vertical)*192
			
		elsif @direction == "horizontal"
		
			@x = @start_x + Math.cos(@time)*128
		elsif @direction == "longrange"
		
			@x = @start_x + Math.cos(@time_longrange)*600
		end
		
		@rectangle.x = @x
		@rectangle.y = @y
	end
	
	def draw
		@@image.draw(@x,@y,0) if @active
	end
	
end
class Pick
attr_accessor :rectangle, :active
	def initialize(x,y,direction)
		@img_bas = Image.new("Assets/pick.png")
		@img_haut = Image.new("Assets/pick_haut.png")
		@img_droite = Image.new("Assets/pick_droite.png")
		@img_gauche = Image.new("Assets/pick_gauche.png")
		@x = x
		@y = y
		@active = true
		@rectangle = Rectangle.new(x,y,@img_bas.width,@img_bas.height)
		
		@direction = direction
	end
	
	
	def draw
		if @direction == "bas"
			@img_bas.draw(@x,@y,0) if @active
		elsif @direction == "gauche"
			@img_gauche.draw(@x,@y,0) if @active
		elsif @direction == "haut"
			@img_haut.draw(@x,@y,0) if @active
		elsif @direction == "droite"
			@img_droite.draw(@x,@y,0) if @active
		end
	end
end