require "binary_transformer/version"
require "mimemagic"
require "kirinnee_core"

module BinaryTransformer

	# Abstract Transformer class
	# Override `accepted_type` and `transform` method
	class Transformer
		# @param [Array<Byte>] bytes
		def map(bytes)
			mime = MimeMagic.by_magic bytes
			if accepted_type.has? "*" or accepted_type.has? mime.type
				transform(bytes)
			else
				bytes
			end
		end

		# @param [Array<Bytes>] bytes input
		# @return [Array<Bytes>]
		def transform(bytes)
			raise NotImplementedError "Abstract definition of transform"
		end

		# @return [Array<String>]
		def accepted_type
			[]
		end
	end
end

module StreamLike

	# Returns a byte array that extends KirinByte
	# @param [BinaryTransformer::Transformer] transformer
	# @return [Array<Byte>]
	def >>(transformer)
		(self > transformer).extend StreamLike
	end

	# Returns a byte array that does not extends KirinByte
	# @param [BinaryTransformer::Transformer] transformer
	# @return [Array<Byte]
	def >(transformer)
		transformer.map self
	end
end
