class MenuState < State

	def initialize(window)
		super(window)
		
		@bg = Image.new("Assets/Back_menu.png")
		
		@font = Font.new(@window, "Polices/almonte_snow.ttf",45)
		
		@bouton_jouer = Button.new(@window, "jouer")
		
		@bouton_jouer.x = (@window.width-@bouton_jouer.width)/2
		@bouton_jouer.y = 150
		
		@bouton_options = Button.new(@window, "options")
		
		@bouton_options.x = (@window.width-@bouton_options.width)/2
		@bouton_options.y = 275
		
		@bouton_credit = Button.new(@window, "credits")
		
		@bouton_credit.x = (@window.width-@bouton_credit.width)/2
		@bouton_credit.y = 400
		
		@bouton_quitter = Button.new(@window, "quitter")
		
		@bouton_quitter.x = (@window.width-@bouton_quitter.width)/2
		@bouton_quitter.y = 525
	end
	
	def update
		if(@bouton_jouer.clicked?)
			@window.current_State=:game
		elsif(@bouton_options.clicked?)
			@window.current_State=:options
		elsif(@bouton_credit.clicked?)
			@window.current_State=:credits
		elsif(@bouton_quitter.clicked?)
			Gosu::close
		end
	end 
	
	def draw
	
		@bg.draw(0,0,0)
	
		@font.draw_text("Mon petit corbeau",(@window.width-@font.text_width("Mon petit corbeau"))/2,5,0,1.0,1.0,Color.argb(0xff_000000))
		
		@bouton_jouer.draw
		@bouton_options.draw
		@bouton_credit.draw
		@bouton_quitter.draw
	end
	
	def reset;end
end