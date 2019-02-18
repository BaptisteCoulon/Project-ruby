class Joueur

        attr_accessor :x, :y ,:z ,:speed, :width, :height
        attr_accessor :life, :invincible
    def initialize()
        @invincible = false
        @life = 3
		@start_time = 0
		@current_time = 0
        @x = 194 
        @y = 576 
        @z = 0
        @speed = 10
        @vy = 0
        @grave = 10
		@grave_effective = @grave
		@hauteur_saut = 192
		@etape_saut = 0
		@vitesse_saut = 12
		@jumping = false
        @img = Gosu::Image.new("Assets/Perso.png")
        @width = @img.width
        @height = @img.height
        @right_rectangle = Rectangle.new(0,0,5,@img.height-30)
        @left_rectangle = Rectangle.new(0,0,5,@img.height-30)
        @up_rectangle = Rectangle.new(0,0,@img.width-30,5)
        @down_rectangle = Rectangle.new(0,0,@img.width-30,5)
    end
    
    def update(tiles)
    
    #Synchro de la poss
        
        
        
        
            # if tile.collides?(@rectangle)
                # return
            # end
        # end
        #mouvement
        
            
        @y += @grave_effective
        
        if Gosu::button_down?(Gosu::KbRight)
            @x += @speed
        end
        if Gosu::button_down?(Gosu::KbLeft)    
            @x -= @speed 
        end
        
        synchronize_rectangles()
        
        tiles.each do |tile|
        next if tile == nil
        
        # if tile.collides?(@down_rectangle)
             # @vy = 0
         # end
        
        if Gosu::button_down?(Gosu::KbUp) and tile.collides?(@down_rectangle) and !@jumping
            #Gestion du saut
             # @vy = 2
            @jumping = true
            puts "2"
            synchronize_rectangles()
            #faire que si tu touche le bloc en haut tu monte plus wallah
            
        end
		
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
			
			@y += 0.1 if passed
			
			passed = false
			
			while tile.collides?(@up_rectangle)
				@y += 1
				synchronize_rectangles()
				passed = true
			end
			
			@y -= 1 if passed
			
		end
		if @jumping
			puts "3"
			@etape_saut += @vitesse_saut
			@y -= @vitesse_saut
			@grave_effective = 0
			synchronize_rectangles()
			if @etape_saut >= @hauteur_saut
				puts "4"
				@jumping = false
				@grave_effective = @grave
				@etape_saut = 0
			end
			puts "5"
		end
		
				@current_time = (Gosu.milliseconds/1000) - @start_time if @invincible
				
				@invincible = false if @current_time == 2
					
				
				
		
	end
	
	def draw 
	
		if not @invincible
			@img.draw(@x,@y,@z)
		else
			@img.draw(@x,@y,@z,1.0,1.0,Color.new(240,240,20,255))
		end
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
	def make_invincible!
		@invincible = true
		@start_time = Gosu.milliseconds/1000
	end
end