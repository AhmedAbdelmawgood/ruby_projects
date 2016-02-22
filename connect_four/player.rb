class Player
	attr_accessor :name, :symbol, :pieces
	def initialize
		puts "player name 'full name'"
		@name = gets.chomp
		@symbol = '★'#, ☗'
		@pieces = []
	end
	def add_piece(position)
		new_piece = create_piece(position)
		pieces << new_piece if new_piece
	end
	def create_piece(position)
		new_piece = Piece.new(position)
		if pieces.include?new_piece
			puts "already existed move"
			return nil
		else
			 new_piece
		end
	end
end