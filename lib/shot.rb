class Shot
	attr_accessor :coordinate, :hit

	def initialize(coordinate, hit = false)
		@coordinate = coordinate
		@hit = hit
	end

end
