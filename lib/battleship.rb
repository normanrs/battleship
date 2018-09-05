require_relative 'board.rb'

class Battleship

  def play
    puts "Welcome to BATTLESHIP"
    puts ""
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
        puts ""
        puts "This version of BATTLESHIP pits you against the computer in a race to sink"
        puts "opponent ships. Ships will be placed on 4-space x 4-space grid, then you"
        puts "each take shots at the others' ships. The first player to sink their"
        puts "opponents' ships wins. Ready to play?"

      elsif start == "p"
        create_computer_board
        create_player_board


      end

    end
  end

  def create_computer_board
    computer_board = Board.new
    computer_board.place_computer_ship("Frigate", 2)
    computer_board.place_computer_ship("Destroyer", 3)
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is a two-unit frigate, the"
    puts "second is a three-unit destroyer."
  end

  def create_player_board

  end

  def display_map(player)

  end

  def player_shot

  end

  def computer_shot

  end

  def end_game

  end
end
game = Battleship.new
game.play
