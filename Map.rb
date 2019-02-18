




class Map 

	attr_reader :tiles, :objects, :width, :height
	def initialize(path)
			file = File.open(path,"r")
			
			x = 0
			y = 0
			i = 0
			
			line_number = File.foreach(path).count
			
			
			
			@tiles = []
			@objects = []
			file.each_line do |line|
				args = line.split(",")
				
				i += 1
				
				args.each do |arg|
					if arg.to_i == 0
						@tiles << nil
					elsif arg.to_i == 1
						@tiles << Tile.new(x,y)
					elsif arg.to_i == 2
						@objects << Cheese.new(x,y)
					elsif arg.to_i == 3
						@tiles << Terre.new(x,y)
					elsif arg.to_i == 4
						@objects << Ennemi.new(x,y,"horizontal")
					elsif arg.to_i == 5
						@objects << Ennemi.new(x,y,"vertical")
					elsif arg.to_i == 6
						@objects << Ennemi.new(x,y,"longrange")
					elsif arg.to_i == 7
						@objects << Pick.new(x,y,"bas")
					elsif arg.to_i == 8
						@objects << Pick.new(x,y,"haut")
					elsif arg.to_i == 9
						@objects << Pick.new(x,y,"droite")
					elsif arg.to_i == 10
						@objects << Pick.new(x,y,"gauche")
					end
					x += 64	
				end
				x = 0 if i<line_number
				y += 64
				
			end
			@width = x
			@height = y

	end
	
	def draw 
		@tiles.each do |tile|
			tile.draw() if tile != nil
		end
		
		@objects.each do |obj|
			obj.draw()
		end
	end
	
	
end