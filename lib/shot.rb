class Shot
	attr_reader :coordinate, :hit

	def initialize(coordinate)
		@coordinate = coordinate
		@hit = false
	end

  def register_hit
    @hit ^= true
  end

end
