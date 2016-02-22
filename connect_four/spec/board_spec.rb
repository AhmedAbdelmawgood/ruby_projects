require 'spec_helper'
describe Board do 
	before :each do 
		player_1 = double('Player')
		player_2 = double('Player')
		allow(player_1).to recieve(:add_piece) 
	end
end