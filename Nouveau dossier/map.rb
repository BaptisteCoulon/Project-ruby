




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
						@objects << Coin.new(x,y)
					elsif arg.to_i == 3
						@tiles << Terre.new(x,y)
						
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