require 'terminal-table'
require './player.rb'
require './piece.rb'
class Board
	attr_accessor :f_player, :s_player, :board
	
	def initialize(args)
		@f_player = args[:player_1]
		@s_player = args[:player_2]
		@board = []
		create_board
	end

	def create_board
		5.times {board << Array.new(8) {" "} }  
		print_board 
	end

	def add_piece(player)
		position = position_calculation
		append_piece_player(player, position)
		row, column = position
		board[row][column] = player_symbol(player)
		print_board
	end

	def position_calculation
		x = gets.chomp.to_i
		check_position(x)
	end

	def check_position(value, init = 0)
		if board[0][value] != " "
			puts "completed column"
			return position_calculation
		end
		place = (board[init][value] unless board[init].nil?)
		if (place.nil? || place != " ")
			return [init-1, value]
		end
		check_position(value, init+1)
	end

	def append_piece_player(player, position)
		player.add_piece(position)
	end

	def player_symbol(player)
		player.symbol
	end

	def print_board
		table = Terminal::Table.new do |t|
			t.add_row [0, 1, 2, 3, 4, 5, 6, 7]
			t.add_separator
			5.times do |num| 
				t.add_row board[num]
				t.add_separator unless num == 4 #don't add seperator after the last row
			end
		end 
		puts table
	end
end