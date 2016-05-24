require_relative "unary_operation"
class Inverse < UnaryOperation
	def execute
		@result = 1 / @operand
	end

end