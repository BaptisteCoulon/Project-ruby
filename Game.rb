require 'gosu' 
require_relative "./Joueur.rb"
require_relative "./Map.rb"
require_relative "./Tiles.rb"
require_relative "./Rectangle.rb"
require_relative "./Ennemi.rb"
require_relative "./Cheese.rb"
require_relative "./State.rb"
require_relative "./GameState.rb"
require_relative "./MenuState.rb"
require_relative "./OptionState.rb"
require_relative "./Button.rb"
#require_relative "./coin.rb"
#require_relative "./terre.rb"
include Gosu

$game = nil

class Game < Gosu::Window
	
	attr_accessor :joueur, :ms_left_pressed

	
	# On initialize la fenetre
	
	attr_accessor :current_State
	
	def initialize
	
		
		
		super 1280,720,false
		
		# On donne un titre a notre fenetre
		self.caption = "Mon Petit Corbeau"
		
		$game = self
		
		
		@current_State = :menu
		@states = {
			menu:MenuState.new(self),
			options:OptionState.new(self),
			game:GameState.new(self)
		}
		@game_State = GameState.new(self)
		
		@ms_left_pressed = false
		#@song = Song.new("Sons/Sound.mp3")
		
		#@coin_song = Sample.new("Assets/coins-in-hand-4.wav")
		
	end
	
	#afficher 
	def update
		@states[@current_State].update
		@ms_left_pressed = false
	end 
	
	def draw
		@states[@current_State].draw
	end
	
	def needs_cursor?
		if @current_State.is_a? MenuState
			return true
		else
			return true
		end
	end
	
	def button_down(id)
		super(id)
		
		if id== MS_LEFT
			@ms_left_pressed = true
		end
	end
	
	def current_State=(value)
		@current_State = value
		@states[@current_State].reset
	end
end

Game.new.show()