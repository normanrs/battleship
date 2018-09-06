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
		fleet.flat_map do |ship|
			ship.placement
		end
	end

	def all_shots(shots)
		shots.flat_map do |shot|
			shot.coordinate
		end
	end

  def shoot_at_computer(coordinate)
		if (all_shots(@shots_at_computer).include?(coordinate))
       puts "You have already fired on that position."
    elsif fleet_positions(@boards[0].ships).include?(coordinate)
			shot = Shot.new(coordinate, true)
			@shots_at_computer << shot
			puts "Your shot at #{coordinate} is a hit!!"
			@boards[0].ships.each do |ship|
				if (ship.placement - all_shots(@shots_at_computer)).empty?
					ship.sink
					puts "You sank the computer's #{ship.name}!!"
				end
			end
		else
			shot = Shot.new(coordinate, false)
			@shots_at_computer << shot
      puts "Your shot at #{coordinate} missed..."
		end
	end

	def shoot_at_human
		available = @boards[1].layout - all_shots(@shots_at_player)
		coordinate = available.sample
		if fleet_positions(@boards[1].ships).include?(coordinate)
			shot = Shot.new(coordinate, true)
			@shots_at_player << shot
			puts "Computer's shot at #{coordinate} is a hit!!"
			@boards[1].ships.each do |ship|
				if (ship.placement - all_shots(@shots_at_player)).empty?
					ship.sink
					puts "The computer sunk your #{ship.name}!!"
				end
			end
		else
			shot = Shot.new(coordinate, false)
			@shots_at_player << shot
      puts "Computer's shot at #{coordinate} missed..."
		end
	end

end
