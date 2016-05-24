require_relative "unary_operation"
class SquareRoot < UnaryOperation
	def execute
		@result = Math.sqrt(@operand)
	end

end
