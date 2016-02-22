module Mechanism
	
	def check(player)
		pieces = player.pieces
		positions = []
		pieces.each { |piece| positions << piece.position }
		return true if check_row(positions)
		return true if check_columns(positions)
		return true if check_diagonals(positions)
		false
	end

	def check_row(positions, row_num = 5)
		row_num.times do |num|
			values = []
			positions.each {|x, y| values << y if x == num }
			if values.length >= 4
				result = values.check_sequences?(4)
				return result if result == true
			end
		end
		false
	end
	def check_column(positions, colum_num = 8 )
		colum_num.times do |num|
			values = []
			positions.each {|x, y| values << x if y == num }
			if values.length >= 4
				result = values.check_sequences?(4)
				return result if result == true
			end
		end
		false
	end

end


class Array 
	def check_sequences?(limit,try = 0, index = self.length-1)
		if try == limit 
			return true
		end
		if self.include?(self[index]+try)
			return check_sequences?(limit, try+1, index)
		else
			return false if index <= 0
			return check_sequences?(limit, 0, index-1)
		end
	end
end
