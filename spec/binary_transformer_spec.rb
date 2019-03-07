require_relative './mock'

describe BinaryTransformer do
	it "has a version number" do
		expect(BinaryTransformer::VERSION).not_to be nil
	end
end

describe BinaryTransformer::Transformer do
	r1b = RemoveOneBytes.new
	c224 = ChangeTwoToFour.new

	describe "overloading and byte mapping" do
		it 'should properly map byte array base on rules' do
			binary = [1, 2, 3, 4, 1, 2, 3, 4]
			binary.extend StreamLike
			expect(binary >> r1b > c224).to eq([4, 3, 4, 4, 3, 4])
		end
	end


end
