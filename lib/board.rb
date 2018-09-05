require_relative 'ship.rb'

class Board
	attr_reader :ships, :layout

	def initialize
		@layout  =   ["a1", "a2", "a3", "a4",
                  "b1", "b2", "b3", "b4",
                  "c1", "c2", "c3", "c4",
                  "d1", "d2", "d3", "d4"]
    @value   =   {"a" => 1, "b" => 2, "c" => 3, "d" => 4}
		@ships   =   []
	end

  def add_midsection(array)
    bow = array[0]
    stern = array[1]
    if bow[0] == stern[0]
      midsection = "#{bow[0]}" + "#{(bow[1].to_i + stern[1].to_i) / 2}"
    else
      value_ref = (@value[bow[0]] + @value[stern[0]]) / 2
      key = "#{@value.key(value_ref)}"
      midsection = key + "#{bow[1]}"
    end
    array << midsection
    array
  end

  def check_diagonal(position)
    position[0][0] != position[1][0] && position[0][1].to_i != position[1][1].to_i
  end

  def check_size(position, size)
    character0_span = (@value[position[0][0]] - @value[position[1][0]]).abs
    character1_span = (position[0][1].to_i - position[1][1].to_i).abs
    character0_span != (size - 1) && character1_span != (size - 1)
  end

  def check_overlap(position, size)
    position = add_midsection(position) if size > 2
    @ships.any? do |ship|
      (position & ship.placement).empty? == false
    end
  end

  def place_player_ship(type, size)
    placed = false
    while placed == false
      puts "The grid has A1 at the top left and D4 at the bottom right."
      puts "Enter the squares for the #{type} #{size}-unit ship:"
      coordinates = gets.chomp.downcase
      position = [coordinates[0] + coordinates[1],coordinates[3] + coordinates[4]]

      if @layout.include?("#{position[0]}") == false || @layout.include?("#{position[1]}") == false
        puts "Bad input or coordinate is off the board."

      elsif check_diagonal(position)
        puts "Ships can be laid either horizontally or vertically"

      elsif check_size(position, size)
        puts "Coordinates must correspond to the first and last units of the ship."

      elsif check_overlap(position, size)
      puts "Ships cannot overlap"

      else
        @ships << Ship.new(type, position)
        puts "#{type} placed at #{position[0]}, #{position[1]}"
        placed = true
      end
    end
  end

  def place_computer_ship(type, size)
    placed = false
    while placed == false
      position = @layout.sample(2)

      if check_diagonal(position)

      elsif check_size(position, size)

      elsif check_overlap(position, size)

      else
        @ships << Ship.new(type, position)
        placed = true
      end
    end
  end
end
