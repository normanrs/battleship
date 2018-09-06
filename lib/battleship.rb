require_relative 'board.rb'
require_relative 'shot.rb'
class Battleship
	attr_reader :boards, :shots

	def initialize
		@boards = []
    @shots = []
	end

  def play
    system 'clear'
    puts "Welcome to BATTLESHIP"
    game_over = false
    while game_over == false
      puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
      start = gets.chomp.downcase

      if ["p", "i", "q"].include?(start) == false
        puts 'Bad input. Enter p, i, or q.'

      elsif start == "q"
        puts "Thank you for trying BATTLESHIP!"
        exit

      elsif start == "i"
        puts "You are in a race against the computer to sink each other's fleet."
        puts "Ships are placed on a 4 x 4 grid, then shots are taken. The first"
        puts "one to sink all opponent ships wins. Ready to play?"

      elsif start == "p"
        create_computer_board
        create_player_board
        shoot(0)
        display_map(0)

      end
    end
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
    player_board = Board.new("Human")
    player_board.place_player_ship("Frigate", 2)
    player_board.place_player_ship("Destroyer", 3)
    @boards << player_board
  end

  def display_map(player_num)
    spaces(player_num)
    puts "==========="
    puts ".  1 2 3 4"
    puts "A #{spaces[0]} #{spaces[1]} #{spaces[2]} #{spaces[3]}"
    puts "B #{spaces[4]} #{spaces[5]} #{spaces[6]} #{spaces[7]}"
    puts "C #{spaces[8]} #{spaces[9]} #{spaces[10]} #{spaces[11]}"
    puts "D #{spaces[12]} #{spaces[13]} #{spaces[14]} #{spaces[15]}"
    puts "==========="
  end

  def spaces(player_num)
    boards[player_num].layout.map do |space|
      if hits.include?(space)
        "H"
      elsif misses.include?(space)
        "M"
      else
        " "
      end


    end

  end

  def shoot(player_num)
    fired = false
    while fired == false
      puts "Enter your shot coordinate:"
      input = gets.chomp.downcase
      position = (input[0] + input[1])
      require "pry"; binding.pry
      if (boards[player_num].layout.include?(position) == false)
        puts "Bad input or coordinate is off the board."
      elsif (boards[player_num].shots.include?(position))
        puts "You have already fired on that position."
      else
        puts "You took a shot at #{position}"
        @shots << shot
        fired = true
      end
      require "pry"; binding.pry
    end
  end

  def end_game
    
  end
end
Battleship.new.play
