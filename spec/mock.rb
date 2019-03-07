class RemoveOneBytes < BinaryTransformer::Transformer
	def accepted_type
		["*"]
	end

	def transform(bytes)
		bytes.select {|x| x != 1}
	end
end

class ChangeTwoToFour < BinaryTransformer::Transformer
	def accepted_type
		["*"]
	end

	def transform(bytes)
		bytes.map {|x| x == 2 ? 4 : x}
	end
end