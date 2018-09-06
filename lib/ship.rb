class Ship
	attr_accessor :name,
							:placement,
              :afloat

	def initialize(name, placement)
		@name = name
		@placement = placement
    @afloat = true
	end

  def sink
    @afloat ^= true
  end

end
