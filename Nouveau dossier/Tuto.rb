#######################################################################################################################################################################################################################################
#################################################################|                                                                           |#########################################################################################
#################################################################|  TUTO RUBY / GOSU SUR LA CREATION DE FENETRE ET LES BASES DE GOSU / RUBY  |#########################################################################################
#################################################################|___________________________________________________________________________|#########################################################################################
#######################################################################################################################################################################################################################################











																#  1.  Creation fenetre 
																
																
																
																

#On importe Gosu qui est un biblio de Ruby, Gosu est utiliser principalement pour dev des jeux vidéale

require 'gosu' 
require "./joueur.rb"
require "./map.rb"
require "./tile.rb"
require "./rectangle.rb"
require "./coin.rb"
require "./terre.rb"
include Gosu

$game = nil

class Game < Gosu::Window
	
	# On initialize la fenetre
	
	def initialize
	
		# On donne la dimention de la fenetre
		super 1280,720,false
		
		$game = self
		
		# On donne un titre a notre fenetre
		self.caption = "Titre de la fenetre"
		
		@background = Gosu::Image.new("back.png", :tileable => true)
		
		@joueur = Joueur.new()
		
		@map = Map.new("map.map")
		
		@font = Font.new(self,"./almonte snow.ttf",45)
		
		@score = 0
		
		@song = Song.new("Sound.mp3")
		
		@coin_song = Sample.new("coins-in-hand-4.wav")
	end
	
	#afficher 
	def update
	
		@song.play(true)if not @song.playing?
		@joueur.update(@map.tiles)
		# if@joueur.collides?(@coin.rectangle) and @coin.active
			# @score += 10
			# @coin.active=false
		# end
		
		@map.objects.each do |obj|
			if @joueur.collides?(obj.rectangle)and obj.active
				@score += 1
				obj.active=false
				
				@coin_song.play()
			end
		end
		
	end 
	
	def draw
		
		
		@background.draw(0,0,0)
		
		cam_x = -@joueur.x+self.width/2-@joueur.width/2
		cam_y = -@joueur.y+self.height/2-@joueur.height/2
		
		cam_x = 0 if cam_x>0
		cam_y = 0 if cam_y>0
		
		cam_x = -@map.width + self.width if cam_x < -@map.width+self.width
		cam_y = -@map.height + self.height if cam_y < -@map.height+self.height
		Gosu.translate(cam_x,cam_y)do
			@joueur.draw
			@map.draw
		end
		
		
		
		@font.draw("Score:#{@score}",0,0,0,1.0,1.0,Color.new(128,0,0,0))

	end

end

Game.new.show()

