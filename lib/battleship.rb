require_relative 'game.rb'
class Battleship

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
        game.create_computer_board
        game.create_player_board
        game.shoot_at_computer
        display_map(0)

      end
    end
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

  def end_game

  end
end
Battleship.new.play
