class GameState < State

	def initialize(window)
		super(window)
		
		#@background = Gosu::Image.new("back.png", :tileable => true)
		
		@joueur = Joueur.new()
		
		@map = Map.new("Maps/Niveau1.map")
		
		@font = Font.new(@window, "Polices/almonte_snow.ttf",45)
		
		@score = 0
		
		@eat_cheese = Sample.new("Assets/eat_cheese.wav")
		
		@song = Song.new("Son/sound.wav")
		
		@game_over = false
	end
	
	def update
		if not @game_over
			@song.play(true)if not @song.playing?
			@joueur.update(@map.tiles)
			@map.objects.each do |obj|
				#Si l'objet est un ennemi
				if obj.is_a? Ennemi
					obj.update
					if @joueur.collides?(obj.rectangle) and not @joueur.invincible
					@joueur.make_invincible!
					@joueur.life -= 1
					end
					
				end
				if obj.is_a? Pick
					if @joueur.collides?(obj.rectangle) and not @joueur.invincible
					@joueur.make_invincible!
					@joueur.life -= 1
					end
					
				end
				#Si l'objet est un fromage
				if obj.is_a? Cheese
					if @joueur.collides?(obj.rectangle)and obj.active
						@score += 1
						obj.active = false
						@eat_cheese.play
					end
				end
			end
		end
		#Le joueur n'a plus de vie
		@game_over = true if @joueur.life <= 0
	end
	
	def draw
		
		cam_x = -@joueur.x+@window.width/2-@joueur.width/2
		cam_y = -@joueur.y+@window.height/2-@joueur.height/2
		
		cam_x = 0 if cam_x > 0
		cam_y = 0 if cam_y > 0
		
		cam_x = -@map.width + @window.width if cam_x < -@map.width+@window.width
		cam_y = -@map.height + @window.height if cam_y < -@map.height+@window.height
		Gosu.translate(cam_x,cam_y)do
			@map.draw
			@joueur.draw
		end
		@font.draw("Score:#{@score}",0,0,0,1.0,1.0,Color.new(128,128,250,0))
		@font.draw_text("Life:#{@joueur.life}",@window.width-@font.text_width("Life:#{@joueur.life}"),-5,0,1.0,1.0,Color.new(128,128,250,0))
		
		@font.draw_text("Game Over",
		(@window.width-@font.text_width("Game Over",2.5))/2,
		(@window.height-@font.height*2.5)/2,
		0,
		2.5,
		2.5,
		Color::RED) if @game_over
	end
	
	def reset
		# @game_over = false
		# @score = 0
		# @joueur.life = @joueur.nbvie
	
	
	end
end