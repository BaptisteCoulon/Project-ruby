class OptionState < State

	#Volume sonore
	#Fullscreen ?
	#


	def initialize(window)
		
		@window = window
		@bg = Image.new("Assets/Back_menu.png")
		@font = Font.new(@window, "Polices/almonte_snow.ttf",45)
		
		@fullscreen = false
		@volume_son = 50
		
		@bouton_retour = Button.new(@window,"retour")
		@bouton_retour.x = (@window.width-@bouton_retour.width)/2
		@bouton_retour.y = @window.height-@bouton_retour.height-100
		
		# @bouton_plus = Button.new(@window,"+")
		
		# @bouton_moins = Button.new(@window,"-")
		
		# @bouton_oui = Button.new(@window,"oui")
		
		# @bouton_non = Button.new(@window,"non")
	end
	
	def update
		if @bouton_retour.clicked?
			@window.current_State=:menu
		end
	end
	
	def draw
		@bg.draw(0,0,0)
		
		@font.draw_text("Options",(@window.width-@font.text_width("Options"))/2,5,0,1.0,1.0,Color.argb(0xff_000000))

		
		@bouton_retour.draw
	end
	
	def reset
	
	end
end