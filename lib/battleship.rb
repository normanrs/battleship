require_relative 'board.rb'
class Battleship
	attr_reader :boards

	def initialize
		@boards = []
	end

  def play
    system 'clear'
    puts "Welcome to BATTLESHIP"
    game_over = false
    parameters = ["p", "i", "q"]
    while game_over == false
      puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
      start = gets.chomp.downcase

      if parameters.include?(start) == false
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
        require "pry"; binding.pry


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

  def display_map(player)
    spaces
    puts "==========="
    puts ".  1 2 3 4"
    puts "A #{spaces[0]} #{spaces[1]} #{spaces[2]} #{spaces[3]}"
    puts "B #{spaces[4]} #{spaces[5]} #{spaces[6]} #{spaces[7]}"
    puts "C #{spaces[8]} #{spaces[9]} #{spaces[10]} #{spaces[11]}"
    puts "D #{spaces[12]} #{spaces[13]} #{spaces[14]} #{spaces[15]}"
    puts "==========="
  end

  def spaces
    board.layout.map do |space|
      if hits.include?(space)
        "H"
      elsif misses.include?(space)
        "M"
      else
        " "
      end


    end

  end

  def player_shot

  end

  def computer_shot

  end

  def end_game

  end
end
Battleship.new.play
