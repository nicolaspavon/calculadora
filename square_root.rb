require_relative "unary_operation"
class SquareRoot < UnaryOperation
	def execute
		@result = sqrt(@operand)
	end

end
