class Button

	attr_accessor :y, :x
	attr_reader :height, :width

	def initialize(window, name)
		@window = window
		@name = name
		@x = 0
		@y = 0
		if @name == "jouer"
		@imgs||={
			normal:Image.new("Assets/Btn_jouer_normal.png"),
			pressed:Image.new("Assets/Btn_jouer_pressed.png")
		}
		elsif @name == "options"
		@imgs||={
			normal:Image.new("Assets/Btn_options_normal.png"),
			pressed:Image.new("Assets/Btn_options_pressed.png")
		}
		elsif @name == "credits"
		@imgs||={
			normal:Image.new("Assets/Btn_Credit_normal.png"),
			pressed:Image.new("Assets/Btn_Credit_pressed.png")
		}
		elsif @name == "quitter"
		@imgs||={
			normal:Image.new("Assets/Btn_Quitter_normal.png"),
			pressed:Image.new("Assets/Btn_Quitter_pressed.png")
		}
		elsif @name == "retour"
		@imgs||={
			normal:Image.new("Assets/Btn_retour_normal.png"),
			pressed:Image.new("Assets/Btn_retour_normal.png")
		}
		elsif @name == "oui"
		@imgs||={
			normal:Image.new("Assets/Btn_oui_normal.png"),
			pressed:Image.new("Assets/Btn_oui_normal.png")
		}
		elsif @name == "non"
		@imgs||={
			normal:Image.new("Assets/Btn_non_normal.png"),
			pressed:Image.new("Assets/Btn_non_normal.png")
		}
		
		end
		@height = @imgs[:normal].height
		@width = @imgs[:normal].width
	end
	
	def update
	
	end
	
	def draw
		if @window.mouse_x >= @x and @window.mouse_y >= @y and @window.mouse_x <= @x + @imgs[:normal].width and @window.mouse_y <= @y + @imgs[:normal].height
			@imgs[:pressed].draw(@x,@y,0)
		else
			@imgs[:normal].draw(@x,@y,0)
		end
	end
	
	def clicked?
		if @window.mouse_x >= @x and @window.mouse_y >= @y and @window.mouse_x <= @x + @imgs[:normal].width and @window.mouse_y <= @y + @imgs[:normal].height
			return @window.ms_left_pressed
		end
	end
end