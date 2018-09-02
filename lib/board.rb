require_relative 'ship.rb'
require_relative 'shot.rb'

class Board

	def initialize
		@layout = ["a1", "a2", "a3", "a4",
                "b1", "b2", "b3", "b4",
                "c1", "c2", "c3", "c4",
                "d1", "d2", "d3", "d4"]
		@ships = []
    @shots = []
	end

  def place_ship(type, size)
    placed = false
    while placed = false
      puts "Enter the squares for the #{type} #{size}-unit ship:"
      gets.chomp 
    end
  end

  def
  end

end
