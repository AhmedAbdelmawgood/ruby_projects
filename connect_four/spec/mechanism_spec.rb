require 'spec_helper'
describe Mechanism do 
	before :each do
		class Test 
			extend Mechanism
		end
		@cell = [
			[4, 2], 
			[4, 4], 
			[4, 5],
			[4, 4], 
			[1, 4],
			[2, 4],
			[4, 3],
			[3, 4] 
		]
		@cell_2 = [
			[4, 2], 
			[4, 7],
			[4, 4], 
			[4, 5], 
			[0, 4],
			[2, 4],
			[3, 4], 
			[4, 4]
		]
	end
	describe '#check_row' do
		it "should be true" do 
			result = Test.check_row(@cell)
			expect(result).to be true
		end
		it "should be false" do 
			result = Test.check_row(@cell_2)
			expect(result).to be false
		end
	end
	describe "#check columns" do 
		it "should be true" do 
			result = Test.check_column(@cell)
			expect(result).to be true
		end
		it "should be false" do 
			result = Test.check_column(@cell_2)
			expect(result).to be false
		end
	end
end