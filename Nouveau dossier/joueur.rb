require "./joueur.rb"
require "./map.rb"
require "./tile.rb"
require "./rectangle.rb"
require "./coin.rb"
require "./terre.rb"

class Joueur

		attr_accessor :x, :y ,:z ,:speed, :width, :height
		
	def initialize()
		
		
		@x = 80 
		@y = 80 
		@z = 0
		@speed = 10
		@jpc = false
		@img = Gosu::Image.new("Perso.png")
		@width = @img.width
		@height = @img.height
		@right_rectangle = Rectangle.new(0,0,5,@img.height-30)
		@left_rectangle = Rectangle.new(0,0,5,@img.height-30)
		@up_rectangle = Rectangle.new(0,0,@img.width-30,5)
		@down_rectangle = Rectangle.new(0,0,@img.width-30,5)
	end
	# def jumpcolide
	
		# if @img.y + 64 && @img.y - 64 != @tiles 
		# @jpc = true
		# end
	# end
	def update(tiles)
	
	#Synchro de la poss
		
		
		# if @vel_y > 0 
				# @allow = false
				# @vel_y .times do 
				 # if Gosu::button_down?(Gosu::KbUp)
					# @y -= @jump
				# end
				# end
				# @vel_y -= 1 
			 # end
				
		
			# @y += @speed 
		
			# if tile.collides?(@rectangle)
				# return
			# end
		# end
		#mouvement
		
			# if Gosu::button_down?(Gosu::KbUp) && @jpc == true   
			if Gosu::button_down?(Gosu::KbUp)   
				@y -= @speed +10
			end  
				
		
			@y += @speed 
		
		
		if Gosu::button_down?(Gosu::KbRight)
            @x += @speed 
        end
	    if Gosu::button_down?(Gosu::KbLeft)    
            @x -= @speed 
        end
		
		synchronize_rectangles()
		
		tiles.each do |tile|
			next if tile == nil
			
			passed = false
			
			while tile.collides?(@right_rectangle)
				@x -= 1
				synchronize_rectangles()
				passed = true
			end
			
			@x += 1 if passed
			
			passed = false
			
			while tile.collides?(@left_rectangle)
				@x += 1
				synchronize_rectangles()
				passed = true
			end
			
			@x -= 1 if passed
			
			passed = false
			
			while tile.collides?(@down_rectangle)
				@y -= 1
				synchronize_rectangles()
				passed = true
			end
			
			@y += 1 if passed
			
			passed = false
			
			while tile.collides?(@up_rectangle)
				@y += 1
				synchronize_rectangles()
				passed = true
			end
			
			@y -= 1 if passed
			
		end
		
	end
	
	
	
	
	def draw 
		@img.draw(@x,@y,@z)
		
		# @right_rectangle.draw()
		# @left_rectangle.draw()
		# @up_rectangle.draw()
		# @down_rectangle.draw()
	end
	
	def synchronize_rectangles
		@left_rectangle.x = @x
		@left_rectangle.y = @y + 15 
		
		@right_rectangle.x = @x + @img.width-@right_rectangle.width
		@right_rectangle.y = @y + 15
		
		@up_rectangle.x = @x + 15
		@up_rectangle.y = @y
		
		@down_rectangle.x = @x + 15
		@down_rectangle.y = @y + @img.height-@down_rectangle.height
	end
	
	def collides?(rect)
		return true if @right_rectangle.collides?(rect)
		return true if @left_rectangle.collides?(rect)
		return true if @up_rectangle.collides?(rect)
		return true if @down_rectangle.collides?(rect)
		return false
	end
end