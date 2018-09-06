require_relative 'board.rb'
require_relative 'shot.rb'
class Game
	attr_reader :boards, :shots_at_computer, :shots_at_player

	def initialize
		@boards = []
    @shots_at_computer = []
		@shots_at_player = []
	end

  def create_computer_board
    computer_board = Board.new
    computer_board.place_computer_ship("Frigate", 2)
    computer_board.place_computer_ship("Destroyer", 3)
    @boards << computer_board
    puts "I have laid out my ships on the grid. You now need to layout"
    puts "your fleet: first, a 2-unit frigate, then a 3-unit destroyer."
  end

  def create_player_board
    player_board = Board.new("human")
    player_board.place_player_ship("Frigate", 2)
    player_board.place_player_ship("Destroyer", 3)
    @boards << player_board
  end

	def fleet_positions(fleet)
		fleet.map do |ship|
			ship.placement
		end
	end

  def shoot_at_computer(coordinate)
		shot_logged = false
		while shot_logged == false
			if (@shots_at_computer.include?(coordinate))
	        puts "You have already fired on that position."
	    elsif fleet_positions(@boards[0].ships).include?(coordinate)
				shot = Shot.new(coordinate, true)
				@shots_at_computer << shot
				puts "Your shot at #{coordinate} is a hit!!"
				shot_logged = true
			else
				shot = Shot.new(coordinate, false)
				@shots_at_computer << shot
	      puts "Your shot at #{coordinate} missed..."
				shot_logged = true
			end
		end
  end

end
