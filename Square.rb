require_relative "unary_operation"
class Square < UnaryOperation
	def execute
		@result = @operand * @operand
	end

end